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

# This first sample replicates the sample code for other languages as 
# found on the betfair developer site.
# This sample demonstrates the generated codes ability to type check
# Type checking with this R api is optional but with the formal representation
# of the XML API defintions it seems a natural part of the implementation
# to cover the specification properly even in the flexible R enevioromnemnt

# sso login. You may also want to set sslcert='<path to ssl certs>/<certname>'
# As this call defaults to the .BetfairEnv$sslcert
# login(appKey,username,password) is an alternative that you can use
# but provides no ssl connection. See the betfair developers guide 
# https://api.developer.betfair.com/
# To use this you need a betfair account and setup an application key
# per the instructions on betfair developers. Also an SSL certificate
# will need to to be created and uploaded to you're account to use
# sso. Again please refer to betfair developers site
ssologin(appKey,username,password)

# Example is for horse racing using pure R interface
eventTypes<-r.listEventTypes(filter=MarketFilter(textQuery="Horse Racing"))
horseRacingTypeId<-eventTypes$result[[1]]$eventType$id

# Get the description of the first market using the catalogue
# Uses R and types checking
firstRace<-r.listMarketCatalogue(
  filter=MarketFilter(eventTypeIds=SetOfEventTypeId(horseRacingTypeId),
                      marketCountries=SetOfCountryCode(countryCode),
                      marketTypeCodes=SetOfMarketType("WIN"),
                      marketStartTime=TimeRange(from=format(Sys.Date(),"%Y-%m-%dT%H:%M:%SZ"))),
  marketProjection=SetOfMarketProjection('RUNNER_DESCRIPTION','MARKET_START_TIME'),
  sort=MarketSort("FIRST_TO_START"),
  maxResults=1
)

# First race market id
marketId<-firstRace$result[[1]]$marketId

projection<-PriceProjection(priceData=SetOfPriceData("EX_BEST_OFFERS"),
                            virtualise=FALSE,
                            exBestOffersOverrides=ExBestOffersOverrides(bestPricesDepth=2L,
                                                            rollupModel=RollupModel("STAKE"),
                                                            rollupLimit=20L),
                            rolloverStakes=FALSE)

# Get all the runners/prices book for this market
# According to the projections
runnersPriceInFirstRace<-r.listMarketBook(
  marketIds=ListOfMarketId(marketId),
  priceProjection=projection,
  orderProjection=OrderProjection("ALL"),
  matchProjection=MatchProjection("ROLLED_UP_BY_PRICE")
)

# First runner in first race
selectionId<-as.integer(runnersPriceInFirstRace$result[[1]]$runners[[1]]$selectionId)

# This is an invalid instruction since the size will not be accepted errorCode:INVALID_BET_SIZE
instruction<-PlaceInstruction(selectionId=selectionId,
                              handicap=0,
                              side=Side('BACK'),
                              orderType=OrderType('LIMIT'),
                              limitOrder=LimitOrder(size=0.01,price=2,persistenceType=PersistenceType('LAPSE')))

# This should not be placed but it demonstrates the place orders function
placeBetResult<-placeOrders(marketId=marketId,
                            instructions=ListOfPlaceInstruction(instruction),
                            customerRef=format(Sys.time(),"Test-%Y-%m-%dT%H:%M:%S"))
# Logout, sso or non-sso
logout()
