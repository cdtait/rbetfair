require(rbetfair)
require(xts)

args <- commandArgs(trailingOnly = TRUE)
appKey <- as.character(args[1])
username <- as.character(args[2])
password <- as.character(args[3])
exchange <- as.character(args[4])

countryCode<-'GB'
if (exchange=='AUS') {
  countryCode<-'AU'
  .BetfairEnv$exchange<-'AUS'
}

# sso login
ssologin(appKey,username,password)

# Get the horse racing event types ids
eventTypes<-listEventTypes(filter=list(textQuery="Horse Racing"))

# Use the first one assuming there is only one anyway
horseRacingTypeId<-eventTypes[1,'eventType.id']

# Get first 10 todays uk horse racing WIN markets 
winHorseRacing<-listMarketCatalogue(
  filter=list(eventTypeIds=list(horseRacingTypeId),
              marketCountries=list(countryCode),
              marketTypeCodes=list("WIN"),
              marketStartTime=list(from=format(Sys.time(),"%Y-%m-%dT%H:%M:%SZ",tz='GMT'))),
  marketProjection=list('EVENT','RUNNER_DESCRIPTION', 'MARKET_START_TIME'),
  sort="LAST_TO_START",
  maxResults=10
)

summaryDesc<-winHorseRacing$description[1,c('marketId','marketName','event.venue','event.name','marketStartTime')]
marketId<-summaryDesc$marketId
marketName<-summaryDesc$marketName
event.venue<-summaryDesc$event.venue
marketStartTime<-format(as.POSIXct(summaryDesc$marketStartTime,format="%Y-%m-%dT%H:%M:%S.000Z",tz='GMT'),"%Y-%m-%d %H:%M",tz="Europe/London",usetz=TRUE)

# Want to look at exchange and sp
projection<-list(priceData=list('EX_ALL_OFFERS','SP_AVAILABLE','SP_TRADED','EX_TRADED'))

# Ask the book for the prices on this market
runnersPriceInRaces<-listMarketBook(
  marketIds=list(marketId),
  priceProjection=projection
)

tryCatch (
{
  # Select the runner id with highest total matched
  selection<-runnersPriceInRaces$runners[order(-runnersPriceInRaces$runners$totalMatched),][1,]
  runnerName<-winHorseRacing$runners[winHorseRacing$runners$selectionId==selection$selectionId,'runnerName']
  
  # Select the runner price details
  overview<-subset(runners$runners,selectionId==sId)
  lastPriceTraded<-overview$lastPriceTraded

  ##### WARNING Commented out below just in case ######
  # This may be a matched order
  #instruction<-PlaceInstruction(selectionId=as.integer(selection$selectionId),
  #                              handicap=0,
  #                              side=Side('BACK'),
  #                              orderType=OrderType('LIMIT'),
  #                              limitOrder=LimitOrder(size=2.00,price=2.00,persistenceType=PersistenceType('LAPSE')))
  
  #placeBetResult<-placeOrders(marketId=marketId,
  #                            instructions=ListOfPlaceInstruction(instruction),
  #                            customerRef=format(Sys.time(),"Test-%Y-%m-%dT%H:%M:%S"))
  
}, interrupt = function(ex) {
  cat("Interrupt detected.\n");
  print(ex);
}, error = function(ex) {
  cat("Error detected.\n");
  print(ex);
}, finally = {
  cat("Logging out.\n");
  logout()
}
)

