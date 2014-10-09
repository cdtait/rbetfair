
require(rbetfair)
require(xts)

get.prices<-function(data,all_runners_prices,all_runners_ids,i)
{
  t <- as.POSIXct(Sys.time(),format = "%Y-%m-%dT%H:%M:%OS")
  overview<-all_runners_prices$runners[,c('selectionId','lastPriceTraded','totalMatched')]
  back<-aggregate(price ~ selectionId,data=all_runners_prices$runners.ex.availableToBack,max)
  lay<-aggregate(price ~ selectionId,data=all_runners_prices$runners.ex.availableToLay,min)
  backLay<-merge(back,lay,by=c('selectionId'),all=T)
  overviewPrice<-merge(overview,backLay,by=c('selectionId'),all=T)
  timePrices<-merge(overviewPrice,all_runners_ids[,c('selectionId','runnerName')],by=c('selectionId'),all=T)
  timePrices<-cbind(timePrices,i)
  timePointAllRunners<-reshape(timePrices, timevar = "runnerName", idvar='i', direction = "wide")
  rownames(timePointAllRunners) <- t
  
  if(is.null(data)) 
    return(timePointAllRunners)
  else 
    return(rbind(data, timePointAllRunners))
}

plotPrices <-function(data,i) {
  limy<-1
  n<-runnerNames[1]
  lastTradeRunnerCol<-paste0('lastPriceTraded.',n)
  
  plot(x = as.xts(1/data[1:i,lastTradeRunnerCol,drop=F]), 
       xlab = "Time",ylab = "Traded Price Probability",
       main = plotTitle, 
       ylim = c(0, limy), 
       major.ticks= "seconds",minor.ticks = F, 
       col = tsRainbow[n])
  
  for (n in runnerNames) {
    lastTradeRunnerCol<-paste0('lastPriceTraded.',n)
    line<-as.xts(1/data[1:i,lastTradeRunnerCol,drop=F])
    lines(x =line, col = tsRainbow[n])
  }
  
  legend(x = 'top',legend = runnerNames,
         lty = 1,col = tsRainbow,
         ncol = 2,xpd = TRUE, 
         bty = "n",
         cex = 0.7)
}

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
eventTypes<-listEventTypes(filter=list(textQuery="Horse Racing"))

# Use the first one assuming there is only one anyway
horseRacingTypeId<-eventTypes[1,'eventType.id']

# Get first 10 todays uk horse racing WIN markets
winHorseRacing<-listMarketCatalogue(
  filter=list(eventTypeIds=list(horseRacingTypeId),
              marketCountries=list(countryCode),
              marketTypeCodes=list("WIN"),
              marketStartTime=list(from=format(Sys.time(),"%Y-%m-%dT%H:%M:%SZ",tz = "GMT"))),
  marketProjection=list('EVENT','RUNNER_DESCRIPTION','MARKET_START_TIME'),
  sort="FIRST_TO_START",
  maxResults=10
)

# Choose market with highest
summaryDesc<-winHorseRacing$description[1,c('marketId','marketName','event.venue','event.name','marketStartTime')]
marketId<-summaryDesc$marketId
marketName<-summaryDesc$marketName
event.venue<-summaryDesc$event.venue
marketStartTime<-format(as.POSIXct(summaryDesc$marketStartTime,format="%Y-%m-%dT%H:%M:%S.000Z",tz='GMT'),"%Y-%m-%d %H:%M",tz="Europe/London",usetz=TRUE)

plotTitle<-paste0(marketStartTime,' ',event.venue,' ',marketName)

# Want to look at exchange and sp
projection<-list(priceData=list('EX_ALL_OFFERS','SP_AVAILABLE','SP_TRADED','EX_TRADED'))
all_runners_prices<-listMarketBook(marketIds=list(marketId),priceProjection=projection)

# Get the runner selection id and names for plot
all_runners_ids<-winHorseRacing$runners[winHorseRacing$runners$marketId==marketId,]

# List of runner names to use in matching colours and labels
runnerNames<-unlist(all_runners_ids[,'runnerName'])
tsRainbow <- rainbow(nrow(all_runners_ids))
names(tsRainbow)<-runnerNames

data<-NULL
i = 1
x11()
tryCatch (
  while(all_runners_prices$books$status=='OPEN' 
        && !all_runners_prices$books$inplay && i < 100)
  {
    all_runners_prices<-listMarketBook(marketIds=list(marketId),priceProjection=projection)
    data<-get.prices(data,all_runners_prices,all_runners_ids,i)
    if (i>1) {
      plotPrices(data,i) 
    }
    i = i + 1
    Sys.sleep(5)
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

pdf("sample6.pdf")
plotPrices(data,i-1) 
dev.off()

cat("Saved plot to sample6.pdf\n");


