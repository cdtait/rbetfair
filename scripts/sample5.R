require(rbetfair)
require(xts)

# Thanks to betwise extras.R
plotPrice <- function(price,back,lay,selection,width=10)
{
  f = as.factor(price)
  names(back)=f
  names(lay) = f
  p1 = par(mfcol=c(1,2))
  idx = back == 0 & lay == 0
  back = back[!idx]
  lay  = lay[!idx]
  ladder = names(lay)
  layPriceIndex = which(lay>0,arr.ind=T)[[1]]
  backPriceIndex = layPriceIndex - which(back[layPriceIndex:1]<1)[[1]]
  bcp = ladder[backPriceIndex]
  lcp = ladder[layPriceIndex]
  minIndex = max(layPriceIndex - width, 1)
  maxIndex = min(backPriceIndex + width, length(ladder))
  idx = seq(minIndex, maxIndex, by=1)
  back = back[idx]
  lay  = lay[idx]
  ladder = ladder[idx]
  ymax = par('usr')[[4]] - par('usr')[[3]]
  l = length(back)
  # The following are taken from barplot.R:
  space = 0.2
  width = rep(1,l)
  delta = width/2
  w.r = cumsum(space + width)
  w.m = w.r - delta
  mx = max(max(back),max(lay))
  mn = min(min(back), min(lay))
  title = paste("To back current price",bcp)
  subtl = paste("Total amount matched",selection$totalMatched)
  barplot(back,col=4,las=1,main=title,sub=subtl,horiz=T,yaxt="n",xlim=c(mx,mn))
  axis(side=4,labels=names(back),at=w.m,las=1,cex.axis=0.8)
  p2=par(mar=c(5,1,4,2))
  title = paste("To lay current price",lcp)
  subtl = paste("Last price traded",selection$lastPriceTraded)
  barplot(lay,col=6,las=1,main=title,sub=subtl,horiz=T,yaxt="n",xlim=c(mn,mx))
  axis(side=2,labels=rep("",l),at=w.m,las=1,cex.axis=0.8)
  par(p2)
  par(p1)
  
  mtext(plotTitle)
}

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
  sort="FIRST_TO_START",
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

pdf("sample5.pdf")

tryCatch (
{
  # Select the runner id with highest total matched
  selection<-runnersPriceInRaces$runners[order(-runnersPriceInRaces$runners$totalMatched),][1,]
  runnerName<-winHorseRacing$runners[winHorseRacing$runners$selectionId==selection$selectionId,'runnerName']
  plotTitle<-paste0(runnerName,' ',marketStartTime,' ',event.venue,' ',marketName)
  
  # Select the runner price details
  runner<-select.runner.prices(runnersPriceInRaces,selection$selectionId)
  
  # Plot Lay, back, total matches and price traded
  plotPrice(runner$prices$price, runner$prices$TotalAvailableToBack, runner$prices$TotalAvailableToLay, selection, width=15)
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

cat("Saved plot to sample5.pdf\n");
