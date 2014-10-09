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
(horseRacingTypeId<-eventTypes[1,'eventType.id'])
# Get first 10 todays uk horse racing WIN markets
(winHorseRacing<-listMarketCatalogue(
  filter=list(eventTypeIds=list(horseRacingTypeId),
              marketCountries=list(countryCode),
              marketTypeCodes=list("WIN"),
              marketStartTime=list(from=format(Sys.time(),"%Y-%m-%dT%H:%M:%SZ"))),
  marketProjection=c('COMPETITION','EVENT','EVENT_TYPE','MARKET_START_TIME','RUNNER_DESCRIPTION'),
  sort='FIRST_TO_START',
  maxResults=10
))

tryCatch (
  {
  # Get a summary set of columns for winHorseRacing from description
  summaryDesc<-winHorseRacing$description[c('marketId','marketName','event.venue','event.name','marketStartTime')]
  # Get a summary set of the runners names
  summaryRunners<-winHorseRacing$runners[c('marketId','selectionId','runnerName')]
  # Join the 2 together baes on the marketId to show summary of the runners in the races together
  summaryRaces<-merge(summaryDesc,summaryRunners,by.x=c('marketId'),by.y=c('marketId'))
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
