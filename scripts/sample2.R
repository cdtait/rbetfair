require(rbetfair)

args <- commandArgs(trailingOnly = TRUE)
appKey <- as.character(args[1])
username <- as.character(args[2])
password <- as.character(args[3])
exchange <- as.character(args[4])

countryCode='GB'
if (exchange=='AUS') {
  countryCode='AU'
  .BetfairEnv$exchange='AUS'
}
# sso login
ssologin(appKey,username,password)

# Get the horse racing event types ids
(eventTypes<-listEventTypes(filter=list(textQuery="Horse Racing")))
# Use the first one assuming there is only one anyway
horseRacingTypeId<-eventTypes[1,'eventType.id'])
# Get first 10 todays uk horse racing WIN markets
(winHorseRacing<-listMarketCatalogue(
  filter=list(eventTypeIds=list(horseRacingTypeId),
                      marketCountries=list(countryCode),
                      marketTypeCodes=list("WIN"),
                      marketStartTime=list(from=format(Sys.Date(),"%Y-%m-%dT%H:%M:%SZ",tz='GMT'))),
  marketProjection=c('COMPETITION','EVENT','EVENT_TYPE','MARKET_DESCRIPTION','RUNNER_DESCRIPTION'),
  sort="FIRST_TO_START",
  maxResults=5
)

# Get a summary set of columns for winHorseRacing from description
summaryDesc<-winHorseRacing$description[c('marketId','marketName','event.venue','event.name','description.marketTime')]
# Get a summary set of the runners names
summaryRunners<-winHorseRacing$runners[c('marketId','selectionId','runnerName')]
# Join the 2 together based on the marketId to show summary of the runners in the races together
summaryRaces<-merge(summaryDesc,summaryRunners,by=c('marketId'))

marketIds<-as.list(winHorseRacing$description[,'marketId'])

# Best prices offers to 2 price depth, to a rollup of STAKE linit 20
projection<-list(priceData=list('EX_BEST_OFFERS'),
                 virtualise=FALSE,
                 exBestOffersOverrides=list(bestPricesDepth=2L,
                                            rollupModel='STAKE',
                                            rollupLimit=20L),
                 rolloverStakes=FALSE)

runnersPriceInRaces<-listMarketBook(
  marketIds=marketIds,
  priceProjection=projection,
  orderProjection='ALL',
  matchProjection='ROLLED_UP_BY_PRICE'
)

(thirdMarketId<-runnersPriceInRaces$books[3,]$marketId)
(runnersInThirdMarket<-subset(summaryRaces, marketId == thirdMarketId))
(summaryThirdRacePrices<-merge(runnersInThirdMarket,
                               runnersPriceInRaces$runners.ex.availableToBack,
                               by.x=c('marketId','selectionId'),
                               by.y=c('marketId','selectionId')))

logout()
