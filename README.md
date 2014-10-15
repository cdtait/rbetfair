rbetfair
========

Betfair API-NG implementation in the R programming language

Betafair started out as an exchange for betting in 2000. See - [What is Befair?](https://betting.betfair.com/what/)

`rbetfair` Is a generated set of R api wrappers which define the specification [Developers Specitfications](https://developer.betfair.com/) for AccountAPING.xml, SportsAPING.xml, HeartbeatAPING.xml. This allows an R application to talk to betfair exchanges a little clearer by defining validation and parameter wrapping rather than using raw JSON parameters and result sets. But of course you are free to use simple lists and vectors and raw JSON if you wish and samples included should demonstrate some of the flexiblity.

Install using GIT and`R CMD build`

First open up R and install the package dependancies

```coffee
p = c("bitops","RCurl","rjson","plyr")
for(x in p)
  if(any(is.na(utils:::packageDescription(x)))) 
    install.packages(x,repos=c('http://cran.at.r-project.org/','http://www.omegahat.org/R'), dependencies = T)
```
Clone the repository and install

```bash
git clone https://github.com/cdtait/rbetfair.git
R CMD INSTALL rbetfair
```

before you can use rbetfair then you will need a user account(username,password), application token for login() and  setup a certificate file if you want to use ssologin. Please refer to these instructions carefully in the section [Getting Started with API-NG](https://api.developer.betfair.com/)

Once the login details are complete can now use rbetfair

```coffee
require(rbetfair)
countryCode='GB'
ssologin(appKey,username,password,sslcert)
# Example is for horse racing using pure R interface
eventTypes<-r.listEventTypes(filter=MarketFilter(textQuery="Horse Racing"))
horseRacingTypeId<-eventTypes$result[[1]]$eventType$id
> horseRacingTypeId
[1] "7"
> # Get the description of the first market using the catalogue
> # Uses R and types checking
> firstRace<-r.listMarketCatalogue(
+     filter=MarketFilter(eventTypeIds=SetOfEventTypeId(horseRacingTypeId),
+                         marketCountries=SetOfCountryCode(countryCode),
+                         marketTypeCodes=SetOfMarketType("WIN"),
+                         marketStartTime=TimeRange(from=format(Sys.Date(),"%Y-%m-%dT%H:%M:%SZ"))),
+     marketProjection=SetOfMarketProjection('RUNNER_DESCRIPTION','MARKET_START_TIME'),
+     sort=MarketSort("FIRST_TO_START"),
+     maxResults=1
+ )
> # First race market id
> marketId<-firstRace$result[[1]]$marketId
> 
> projection<-PriceProjection(priceData=SetOfPriceData("EX_BEST_OFFERS"),
+                             virtualise=FALSE,
+                             exBestOffersOverrides=ExBestOffersOverrides(bestPricesDepth=2L,
+                                                                         rollupModel=RollupModel("STAKE"),
+                                                                         rollupLimit=20L),
+                             rolloverStakes=FALSE)
> 
> # Get all the runners/prices book for this market
> # According to the projections
> # This output is in data.frame formatted result
> runnersPriceInFirstRace<-listMarketBook(
+     marketIds=ListOfMarketId(marketId),
+     priceProjection=projection,
+     orderProjection=OrderProjection("ALL"),
+     matchProjection=MatchProjection("ROLLED_UP_BY_PRICE")
+ )
> 
> # First runner in first race prices
> runnersPriceInFirstRace
$books
     marketId isMarketDataDelayed status betDelay bspReconciled complete inplay numberOfWinners numberOfRunners
1 1.115890249               FALSE   OPEN        0         FALSE     TRUE  FALSE               1               5
  numberOfActiveRunners            lastMatchTime totalMatched totalAvailable crossMatching runnersVoidable   version
1                     5 2014-10-12T13:28:55.904Z     293634.3       145921.6          TRUE           FALSE 839505678

$runners
  selectionId handicap status adjustmentFactor lastPriceTraded totalMatched    marketId
1     8850778        0 ACTIVE             51.9            1.82    212755.79 1.115890249
2     8715880        0 ACTIVE             22.7            4.90     41887.00 1.115890249
3     8692943        0 ACTIVE             14.8            7.20     24400.79 1.115890249
4     8460412        0 ACTIVE              5.9           19.00      5295.09 1.115890249
5     8861767        0 ACTIVE              4.5           18.50      9295.58 1.115890249

$runners.sp
data frame with 0 columns and 0 rows

$runners.sp.backStakeTaken
data frame with 0 columns and 0 rows

$runners.sp.layLiabilityTaken
data frame with 0 columns and 0 rows

$runners.ex.availableToBack
   price    size    marketId selectionId
1   1.82 5197.52 1.115890249     8850778
2   1.81 3571.37 1.115890249     8850778
3   4.80  812.61 1.115890249     8715880
4   4.70  458.68 1.115890249     8715880
5   7.00  608.73 1.115890249     8692943
6   6.80  236.00 1.115890249     8692943
7  18.50  286.78 1.115890249     8460412
8  18.00  155.63 1.115890249     8460412
9  18.00   49.85 1.115890249     8861767
10 17.50  123.08 1.115890249     8861767

$runners.ex.availableToLay
   price    size    marketId selectionId
1   1.83 1903.75 1.115890249     8850778
2   1.84 1174.08 1.115890249     8850778
3   4.90  477.20 1.115890249     8715880
4   5.00  425.68 1.115890249     8715880
5   7.20  162.98 1.115890249     8692943
6   7.40 1871.18 1.115890249     8692943
7  19.00  432.54 1.115890249     8460412
8  19.50   97.97 1.115890249     8460412
9  18.50  107.34 1.115890249     8861767
10 19.00  145.44 1.115890249     8861767

$runners.ex.tradedVolume
data frame with 0 columns and 0 rows

# Don't forget to 
logout()

```

