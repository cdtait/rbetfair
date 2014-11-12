################################################################################
# Description: Support functions to help convert lists to data.frames. 
################################################################################
# TODO Refactor/simplify
add.marketId<-function(l,marketId)
{ 
  if (length(l)>0) {
    l$marketId<-marketId
  }
  data.frame(l,stringsAsFactors = FALSE)
}

add.marketId.selectionId<-function(l,marketId,selectionId)
{ 
  if (length(l)>0) {
    l$marketId<-marketId
    l$selectionId<-selectionId
  }
  data.frame(l,stringsAsFactors = FALSE)
}

catalogue.runners<-function(catalogue) { 
  ldply(catalogue$runners,add.marketId,catalogue$marketId) 
}

catalogue.description<-function(catalogue) {
  data.frame(catalogue[names(catalogue) != "runners"],stringsAsFactors = FALSE)
}

book.runner.matches<-function(runner,marketId) {
  add.marketId.selectionId(runner$matches,marketId,runner$selectionId)
}

book.runners.matches<-function(book) { 
  ldply(book$runners,book.runner.matches,book$marketId) 
}

book.runner.orders<-function(runner,marketId) {
  add.marketId.selectionId(runner$orders,marketId,runner$selectionId)
}

book.runners.orders<-function(book) { 
  ldply(book$runners,book.runner.orders,book$marketId) 
}

book.runner.ex.tradedVolume.pricesize<-function(pricesize,marketId,selectionId) {
  add.marketId.selectionId(pricesize,marketId,selectionId)
}

book.runner.ex.tradedVolume<-function(runner,marketId) {
  ldply(runner$ex$tradedVolume,book.runner.ex.tradedVolume.pricesize,marketId,runner$selectionId) 
}

book.runners.ex.tradedVolume<-function(book) { 
  ldply(book$runners,book.runner.ex.tradedVolume,book$marketId) 
}

book.runner.ex.availableToLay.pricesize<-function(pricesize,marketId,selectionId) {
  add.marketId.selectionId(pricesize,marketId,selectionId)
}

book.runner.ex.availableToLay<-function(runner,marketId) {
  ldply(runner$ex$availableToLay,book.runner.ex.availableToLay.pricesize,marketId,runner$selectionId) 
}

book.runners.ex.availableToLay<-function(book) { 
  ldply(book$runners,book.runner.ex.availableToLay,book$marketId) 
}

book.runner.ex.availableToBack.pricesize<-function(pricesize,marketId,selectionId) {
  add.marketId.selectionId(pricesize,marketId,selectionId)
}

book.runner.ex.availableToBack<-function(runner,marketId) {
  ldply(runner$ex$availableToBack,book.runner.ex.availableToBack.pricesize,marketId,runner$selectionId) 
}

book.runners.ex.availableToBack<-function(book) { 
  ldply(book$runners,book.runner.ex.availableToBack,book$marketId) 
}

book.runner.ex.layLiabilityTaken.pricesize<-function(pricesize,marketId,selectionId) {
  add.marketId.selectionId(pricesize,marketId,selectionId)
}

book.runner.sp.layLiabilityTaken<-function(runner,marketId) {
  ldply(runner$sp$layLiabilityTaken,book.runner.ex.layLiabilityTaken.pricesize,marketId,runner$selectionId) 
}

book.runners.sp.layLiabilityTaken<-function(book) { 
  ldply(book$runners,book.runner.sp.layLiabilityTaken,book$marketId) 
}

book.runner.ex.backStakeTaken.pricesize<-function(pricesize,marketId,selectionId) {
  add.marketId.selectionId(pricesize,marketId,selectionId)
}

book.runner.sp.backStakeTaken<-function(runner,marketId) {
  ldply(runner$sp$backStakeTaken,book.runner.ex.backStakeTaken.pricesize,marketId,runner$selectionId) 
}

book.runners.sp.backStakeTaken<-function(book) { 
  ldply(book$runners,book.runner.sp.backStakeTaken,book$marketId) 
}

book.runner.sp<-function(runner,marketId) {
  desc<-runner$sp[!names(runner$sp) %in% c('backStakeTaken','layLiabilityTaken')]
  add.marketId.selectionId(desc,marketId,runner$selectionId)
}

book.runners.sp<-function(book) { 
  ldply(book$runners,book.runner.sp,book$marketId) 
}

book.runner<-function(runner,marketId) {
  add.marketId(runner[!names(runner) %in% c('sp','ex','orders','matches')],marketId)
}

book.runners<-function(book) { 
  ldply(book$runners,book.runner,book$marketId) 
}

market.book<-function(book) {
  data.frame(book[names(book) != "runners"],
             stringsAsFactors = FALSE)
}

marketProfitAndLoss<-function(profitAndLoss) {
  ldply(profitAndLoss$profitAndLosses,add.marketId,profitAndLoss$marketId) 
}

commissionApplied<-function(profitAndLoss) {
  if(!is.null(profitAndLoss$commissionApplied)) {
    data.frame(marketId=profitAndLoss$marketId,
               commissionApplied=profitAndLoss$commissionApplied,
               stringsAsFactors = FALSE)
  }
  else {
    data.frame(marketId=profitAndLoss$marketId,
               commissionApplied=NA,
               stringsAsFactors = FALSE)
  }
}

instruction.report<-function(instruction,marketId) {
  add.marketId(instruction,marketId)
}

dev.app<-function(app) {
  data.frame(appId=app$appId,
             appName=app$appName,
             stringsAsFactors = FALSE)
}

app.version<-function(version,appId) {
  version$appId<-appId
  data.frame(version=version,
             stringsAsFactors = FALSE)
}

dev.keys<-function(app) {
  ldply(app$appVersions,app.version,app$appId) 
}

# Create a prices object from all the runner price components
select.runner.prices<-function(runners,sId) {
  overview<-subset(runners$runners,selectionId==sId)
  sp<-subset(runners$runners.sp,selectionId==sId)
  availableToBack<-subset(runners$runners.ex.availableToBack,selectionId==sId)
  availableToLay<-subset(runners$runners.ex.availableToLay,selectionId==sId)
  if (nrow(runners$runners.sp.backStakeTaken)>0) {
    backStakeTaken<-subset(runners$runners.sp.backStakeTaken,selectionId==sId)
  }
  if (nrow(runners$runners.sp.layLiabilityTaken)>0) {
    layLiabilityTaken<-subset(runners$runners.sp.layLiabilityTaken,selectionId==sId)
  }
  if (nrow(runners$runners.ex.tradedVolume)>0) {
    tradedVolume<-subset(runners$runners.ex.tradedVolume,selectionId==sId)
  }
  # Rename columns so we can bind them in a ladder
  availableToBack<-rename(availableToBack, c('size'='TotalAvailableToBack'))
  availableToLay<-rename(availableToLay, c('size'='TotalAvailableToLay'))
  if (exists('backStakeTaken')) {
    backStakeTaken<-rename(backStakeTaken,c('size'='TotalBSPLayLiability'))
  }
  if (exists('layLiabilityTaken')) {
    layLiabilityTaken<-rename(layLiabilityTaken,c('size'='TotalBSPBackersStakeVolume'))
  }
  
  # Build a price ladder
  priceLadder<-rbind.fill(availableToBack,availableToLay)
  if (exists('backStakeTaken')) {
    priceLadder<-merge(priceLadder,backStakeTaken,by=c('price','marketId','selectionId'),all=T)
  }
  if (exists('layLiabilityTaken')) {
    priceLadder<-merge(priceLadder,layLiabilityTaken,by=c('price','marketId','selectionId'),all=T)
  }
  priceLadder<-priceLadder[order(priceLadder$price),] 
  priceLadder[is.na(priceLadder)] <- 0
  
  list(overview=overview,sp=sp,prices=priceLadder)
}

################################################################################
#' @title listEventTypes
#' @description Returns a list of Event Types (i.e. Sports) associated with the markets
#' selected by the MarketFilter. 
#' @param   filter is mandatory of type MarketFilter.
#'          The filter to select desired markets. All markets that match the
#'          criteria in the filter are selected. 
#' @param   locale is optional of type character.
#'          The language used for the response. If not specified, the default is
#'          returned. 
#' @return  output data as data.frame
#' @examples
#' # Get the horse racing event types ids
#' (eventTypes<-listEventTypes(filter=list(textQuery="Horse Racing")))
################################################################################
listEventTypes<-function(filter=MarketFilter(), locale=NULL ,
                           exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                           sessionToken=.BetfairEnv$sessionToken) {
  eventTypes<-r.listEventTypes(filter=filter, locale=locale , exchange=exchange,
                           appKey=appKey, sessionToken=sessionToken)$result
  ldply(eventTypes,data.frame,stringsAsFactors = FALSE)
}

################################################################################
#' @title listCompetitions
#' @description Returns a list of Competitions (i.e., World Cup 2013) associated with the
#' markets selected by the MarketFilter. Currently only Football markets have an
#' associated competition. 
#' @param   filter is mandatory of type MarketFilter.
#'          The filter to select desired markets. All markets that match the
#'          criteria in the filter are selected. 
#' @param   locale is optional of type character.
#'          The language used for the response. If not specified, the default is
#'          returned. 
#' @return  output data.frame
#' @examples
#' (competitions<-listCompetitions())
################################################################################
listCompetitions<-function(filter=MarketFilter(), locale=NULL ,
                             exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                             sessionToken=.BetfairEnv$sessionToken) {
  competitions<-r.listCompetitions(filter=filter, locale=locale , exchange=exchange,
                             appKey=appKey, sessionToken=sessionToken)$result
  ldply(competitions,data.frame,stringsAsFactors = FALSE)
}

################################################################################
#' @title listTimeRanges
#' @description Returns a list of time ranges in the granularity specified in the request
#' (i.e. 3PM to 4PM, Aug 14th to Aug 15th) associated with the markets selected
#' by the MarketFilter. 
#' @param   filter is mandatory of type MarketFilter.
#'          The filter to select desired markets. All markets that match the
#'          criteria in the filter are selected. 
#' @param   granularity is mandatory of type TimeGranularity.
#'          The granularity of time periods that correspond to markets selected by
#'          the market filter. 
#' @return  output data.frame
#' @examples
#' # Include granularity
#' listTimeRanges(granularity=TimeGranularity('DAYS'))
#' @note Even though the xml specifies granularity optional you need to include it
################################################################################
listTimeRanges<-function(filter=MarketFilter(), granularity=TimeGranularity()
                           , exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                           sessionToken=.BetfairEnv$sessionToken) {
  timeranges<-r.listTimeRanges(filter=filter, granularity=granularity ,
                        exchange=exchange, appKey=appKey, 
                        sessionToken=sessionToken)$result
  ldply(timeranges,data.frame,stringsAsFactors = FALSE)
}

################################################################################
#' @title listEvents
#' @description Returns a list of Events (i.e, Reading vs. Man United) associated with the
#' markets selected by the MarketFilter. 
#' @param   filter is mandatory of type MarketFilter.
#'          The filter to select desired markets. All markets that match the
#'          criteria in the filter are selected. 
#' @param   locale is optional of type character.
#'          The language used for the response. If not specified, the default is
#'          returned. 
#' @examples
#' # Using raw R return get eventTypes
#' eventTypes<-r.listEventTypes(filter=MarketFilter(textQuery="Horse Racing"))
#' horseRacingTypeId<-eventTypes$result[[1]]$eventType$id
#' filter=MarketFilter(eventTypeIds=SetOfEventTypeId(horseRacingTypeId))
#' listEvents(filter=filter)
################################################################################
listEvents<-function(filter=MarketFilter(), locale=NULL ,
                       exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                       sessionToken=.BetfairEnv$sessionToken) {
  events<-r.listEvents(filter=filter, locale=locale , exchange=exchange,
                       appKey=appKey, sessionToken=sessionToken)$result
  ldply(events,data.frame,stringsAsFactors = FALSE)
}
. 
################################################################################
#' @title listMarketTypes
#' @description Returns a list of market types (i.e. MATCH_ODDS, NEXT_GOAL) associated with
#' the markets selected by the MarketFilter. The market types are always the
#' same, regardless of locale. 
#' @param   filter is mandatory of type MarketFilter.
#'          The filter to select desired markets. All markets that match the
#'          criteria in the filter are selected. 
#' @param   locale is optional of type character.
#'          The language used for the response. If not specified, the default is
#'          returned. 
#' @return  output data
#' @examples
#' listMarketTypes(filter=MarketFilter(textQuery="Horse Racing"))
################################################################################
listMarketTypes<-function(filter=MarketFilter(), locale=NULL ,
                            exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                            sessionToken=.BetfairEnv$sessionToken) {
  marketTypes<-r.listMarketTypes(filter=filter, locale=locale , exchange=exchange,
                            appKey=appKey, sessionToken=sessionToken)$result
  ldply(marketTypes,data.frame,stringsAsFactors = FALSE)
}

################################################################################
#' @title listCountries
#' @description Returns a list of Countries associated with the markets selected by the
#' MarketFilter.
#' @param   filter is mandatory of type MarketFilter.
#'          The filter to select desired markets. All markets that match the
#'          criteria in the filter are selected. 
#' @param   locale is optional of type character.
#'          The language used for the response. If not specified, the default is
#'          returned. log
#' @return  output data
#' @examples
#' listCountries()
################################################################################
listCountries<-function(filter=MarketFilter(), locale=NULL ,
                          exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                          sessionToken=.BetfairEnv$sessionToken) {
  countries<-r.listCountries(filter=filter, locale=locale , exchange=exchange,
                          appKey=appKey, sessionToken=sessionToken)$result
  ldply(countries,data.frame,stringsAsFactors = FALSE)
}

################################################################################
#' @title listVenues
#' @description Returns a list of Venues (i.e. Cheltenham, Ascot) associated with the markets
#' selected by the MarketFilter. Currently, only Horse Racing markets are
#' associated with a Venue. 
#' @param   filter is mandatory of type MarketFilter.
#'          The filter to select desired markets. All markets that match the
#'          criteria in the filter are selected. 
#' @param   locale is optional of type character.
#'          The language used for the response. If not specified, the default is
#'          returned. 
#' @return  output data.frame of venues
#' @examples
#' listVenues(filter=MarketFilter(textQuery="Horse Racing"))
################################################################################
listVenues<-function(filter=MarketFilter(), locale=NULL ,
                       exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                       sessionToken=.BetfairEnv$sessionToken) {
  venues<-r.listVenues(filter=filter, locale=locale , exchange=exchange,
                       appKey=appKey, sessionToken=sessionToken)$result
  ldply(venues,data.frame,stringsAsFactors = FALSE)
}

################################################################################
#' @title listMarketCatalogue
#' @description Returns a list of information about markets that does not change (or changes
#' very rarely). You use listMarketCatalogue to retrieve the name of the market,
#' the names of selections and other information about markets. 
#' @param   filter is mandatory of type MarketFilter.
#'          The filter to select desired markets. All markets that match the
#'          criteria in the filter are selected. 
#' @param   marketProjection is optional of type SetOfMarketProjection.
#'          The type and amount of data returned about the market.
#' @param   sort is optional of type MarketSort.
#'          The order of the results. Will default to RANK if not passed
#' @param   maxResults is mandatory of type integer.
#'          limit on the total number of results returned, must be greater than 0
#'          and less than or equal to 1000 
#' @param   locale is optional of type character.
#'          The language used for the response. If not specified, the default is
#'          returned. 
#' @return  output data.frame
#' @examples
#' # Example is for horse racing using pure R interface
#' eventTypes<-r.listEventTypes(filter=MarketFilter(textQuery="Horse Racing"))
#' horseRacingTypeId<-eventTypes$result[[1]]$eventType$id
#'
#' # Get the description of the first market using the catalogue
#' # Uses R and types checking
#' firstRace<-r.listMarketCatalogue(
#'  filter=MarketFilter(eventTypeIds=SetOfEventTypeId(horseRacingTypeId),
#'                      marketCountries=SetOfCountryCode(countryCode),
#'                      marketTypeCodes=SetOfMarketType("WIN"),
#'                      marketStartTime=TimeRange(from=format(Sys.Date(),"%Y-%m-%dT%H:%M:%SZ"))),
#'  marketProjection=SetOfMarketProjection('RUNNER_DESCRIPTION','MARKET_START_TIME'),
#'  sort=MarketSort("FIRST_TO_START"),
#'  maxResults=1
#' )
#' 
#' # Get first 10 todays uk horse racing WIN markets 
#' winHorseRacing<-listMarketCatalogue(
#'   filter=list(eventTypeIds=list(horseRacingTypeId),
#'               marketCountries=list(countryCode),
#'               marketTypeCodes=list("WIN"),
#'               marketStartTime=list(from=format(Sys.time(),"%Y-%m-%dT%H:%M:%SZ",tz='GMT'))),
#'   marketProjection=list('EVENT','RUNNER_DESCRIPTION', 'MARKET_START_TIME'),
#'   sort="LAST_TO_START",
#'   maxResults=10
#' )
################################################################################
listMarketCatalogue<-function(filter=MarketFilter(), marketProjection=NULL,
                                sort=NULL, maxResults=i32(), locale=NULL , exchange=.BetfairEnv$exchange,
                                appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  catalogues<-r.listMarketCatalogue(filter=filter, marketProjection=marketProjection,
                                sort=sort, maxResults=maxResults, locale=locale , exchange=exchange,
                                appKey=appKey, sessionToken=sessionToken)$result
  
  return(list(runners=ldply(catalogues,catalogue.runners),
              description=ldply(catalogues,catalogue.description)))
}

################################################################################
#' @title listMarketBook
#' @description Returns a list of dynamic data about markets. Dynamic data includes prices,
#' the status of the market, the status of selections, the traded volume, and
#' the status of any orders you have placed in the market. 
#' @param   marketIds is mandatory of type ListOfMarketId.
#'          One or more market ids. The number of markets returned depends on the
#'          amount of data you request via the price projection. 
#' @param   priceProjection is optional of type PriceProjection.
#'          The projection of price data you want to receive in the response.
#' @param   orderProjection is optional of type OrderProjection.
#'          The orders you want to receive in the response.
#' @param   matchProjection is optional of type MatchProjection.
#'          If you ask for orders, specifies the representation of matches.
#' @param   currencyCode is optional of type character.
#'          A Betfair standard currency code. If not specified, the default
#'          currency code is used. 
#' @param   locale is optional of type character.
#'          The language used for the response. If not specified, the default is
#'          returned. 
#' @return  output data
#' @examples
#' projection<-PriceProjection(priceData=SetOfPriceData("EX_BEST_OFFERS"),
#' virtualise=FALSE,
#' exBestOffersOverrides=ExBestOffersOverrides(bestPricesDepth=2L,
#'                                             rollupModel=RollupModel("STAKE"),
#'                                             rollupLimit=20L),
#' rolloverStakes=FALSE)
#' 
#' # Get all the runners/prices book for this market
#' # According to the projections
#' runnersPriceInFirstRace<-r.listMarketBook(
#'   marketIds=ListOfMarketId(marketId),
#'   priceProjection=projection,
#'   orderProjection=OrderProjection("ALL"),
#'   matchProjection=MatchProjection("ROLLED_UP_BY_PRICE")
#' )
#' 
#' # Want to look at exchange and sp
#' projection<-list(priceData=list('EX_ALL_OFFERS','SP_AVAILABLE','SP_TRADED','EX_TRADED'))
#' 
#' # Ask the book for the prices on this market
#' runnersPriceInRaces<-listMarketBook(
#'   marketIds=list(marketId),
#'   priceProjection=projection
#' )
################################################################################
listMarketBook<-function(marketIds=ListOfMarketId(), priceProjection=NULL,
                           orderProjection=NULL, matchProjection=NULL, currencyCode=NULL, locale=NULL ,
                           exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                           sessionToken=.BetfairEnv$sessionToken) {
  lbooks<-r.listMarketBook(marketIds=marketIds, priceProjection=priceProjection,
                           orderProjection=orderProjection, matchProjection=matchProjection,
                           currencyCode=currencyCode, locale=locale , exchange=exchange, appKey=appKey,
                           sessionToken=sessionToken)$result

  return(list(books=ldply(lbooks,market.book),
              runners=ldply(lbooks,book.runners),
              runners.sp=ldply(lbooks,book.runners.sp),
              runners.sp.backStakeTaken=ldply(lbooks,book.runners.sp.backStakeTaken),
              runners.sp.layLiabilityTaken=ldply(lbooks,book.runners.sp.layLiabilityTaken),
              runners.ex.availableToBack=ldply(lbooks,book.runners.ex.availableToBack),
              runners.ex.availableToLay=ldply(lbooks,book.runners.ex.availableToLay),
              runners.ex.tradedVolume=ldply(lbooks,book.runners.ex.tradedVolume),
              runners.orders=ldply(lbooks,book.runners.orders),
              runners.matches=ldply(lbooks,book.runners.matches),
              )
         )
}

################################################################################
#' @title listCurrentOrders
#' @description Returns a list of your current orders. Optionally you can filter and sort
#' your current orders using the various parameters, setting none of the
#' parameters will return all of your current orders, up to a maximum of 1000
#' bets, ordered BY_BET and sorted EARLIEST_TO_LATEST. To retrieve more than
#' 1000 orders, you need to make use of the fromRecord and recordCount
#' parameters. 
#' @param   betIds is optional of type SetOfBetId.
#'          Optionally restricts the results to the specified bet IDs. 
#' @param   marketIds is optional of type SetOfMarketId.
#'          Optionally restricts the results to the specified market IDs. 
#' @param   orderProjection is optional of type OrderProjection.
#'          Optionally restricts the results to the specified order status. 
#' @param   placedDateRange is optional of type TimeRange.
#'          Deprecated use dateRange instead. Optionally restricts the results to
#'          be from/to the specified placed date. This date is inclusive, i.e. if
#'          an order was placed on exactly this date (to the millisecond) then it
#'          will be included in the results. If the from is later than the to, no
#'          results will be returned. 
#' @param   dateRange is optional of type TimeRange.
#'          Replacement for placedDateRange to allow filtering by other date
#'          fields rather than just placedDate. Optionally restricts the results
#'          to be from/to the specified date, these dates are contextual to the
#'          orders being returned and therefore the dates used to filter on will
#'          change to placed, matched, voided or settled dates depending on the
#'          orderBy. This date is inclusive, i.e. if an order was placed on
#'          exactly this date (to the millisecond) then it will be included in the
#'          results. If the from is later than the to, no results will be
#'          returned. 
#' @param   orderBy is optional of type OrderBy.
#'          Specifies how the results will be ordered. If no value is passed in,
#'          it defaults to BY_BET. Also acts as a filter such that only orders
#'          with a valid value in the field being ordered by will be returned
#'          (i.e. BY_VOID_TIME returns only voided orders, BY_SETTLED_TIME returns
#'          only settled orders and BY_MATCH_TIME returns only orders with a
#'          matched date (voided, settled, matched orders)). 
#' @param   sortDir is optional of type SortDir.
#'          Specifies the direction the results will be sorted in. If no value is
#'          passed in, it defaults to EARLIEST_TO_LATEST. 
#' @param   fromRecord is optional of type integer.
#'          Specifies the first record that will be returned. Records start at
#'          index zero, not at index one. 
#' @param   recordCount is optional of type integer.
#'          Specifies how many records will be returned, from the index position
#'          'fromRecord'. Note that there is a page size limit of 1000. A value of
#'          zero indicates that you would like all records (including and from
#'          'fromRecord') up to the limit. 
#' @return \code{\link{CurrentOrderSummaryReport}}
#' @examples
#' listCurrentOrders()
################################################################################
listCurrentOrders<-function(betIds=NULL, marketIds=NULL, orderProjection=NULL,
                              placedDateRange=NULL, dateRange=NULL, orderBy=NULL, sortDir=NULL,
                              fromRecord=NULL, recordCount=NULL , exchange=.BetfairEnv$exchange,
                              appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  currentOrders<-r.listCurrentOrders(betIds=betIds, marketIds=marketIds,
                              orderProjection=orderProjection, placedDateRange=placedDateRange,
                              dateRange=dateRange, orderBy=orderBy, sortDir=sortDir, fromRecord=fromRecord,
                              recordCount=recordCount , exchange=exchange, appKey=appKey,
                              sessionToken=sessionToken)$result
  list(currentOrders=ldply(currentOrders$currentOrders,data.frame,stringsAsFactors = FALSE),
       moreAvailable=currentOrders$moreAvailable)
}

################################################################################
#' @title listClearedOrders
#' @description Returns a List of bets based on the bet status, ordered by settled date 
#' @param   betStatus is mandatory of type BetStatus.
#'          Restricts the results to the specified status. 
#' @param   eventTypeIds is optional of type SetOfEventTypeId.
#'          Optionally restricts the results to the specified Event Type IDs. 
#' @param   eventIds is optional of type SetOfEventId.
#'          Optionally restricts the results to the specified Event IDs. 
#' @param   marketIds is optional of type SetOfMarketId.
#'          Optionally restricts the results to the specified market IDs. 
#' @param   runnerIds is optional of type SetOfRunnerId.
#'          Optionally restricts the results to the specified Runners. 
#' @param   betIds is optional of type SetOfBetId.
#'          Optionally restricts the results to the specified bet IDs. 
#' @param   side is optional of type Side.
#'          Optionally restricts the results to the specified side. 
#' @param   settledDateRange is optional of type TimeRange.
#'          Optionally restricts the results to be from/to the specified settled
#'          date. This date is inclusive, i.e. if an order was placed on exactly
#'          this date (to the millisecond) then it will be included in the
#'          results. If the from is later than the to, no results will be
#'          returned. 
#' @param   groupBy is optional of type GroupBy.
#'          How to aggregate the lines, if not supplied then the lowest level is
#'          returned, i.e. bet by bet This is only applicable to SETTLED
#'          BetStatus. 
#' @param   includeItemDescription is optional of type logical.
#'          If true then an ItemDescription object is included in the response. 
#' @param   locale is optional of type character.
#'          The language used for the itemDescription. If not specified, the
#'          customer account default is returned. 
#' @param   fromRecord is optional of type integer.
#'          Specifies the first record that will be returned. Records start at
#'          index zero. 
#' @param   recordCount is optional of type integer.
#'          Specifies how many records will be returned, from the index position
#'          'fromRecord'. Note that there is a page size limit of 1000. A value of
#'          zero indicates that you would like all records (including and from
#'          'fromRecord') up to the limit. 
#' @return \code{\link{ClearedOrderSummaryReport}}
#' @examples
#' listCurrentOrders()
################################################################################
listClearedOrders<-function(betStatus=BetStatus(), eventTypeIds=NULL,
                              eventIds=NULL, marketIds=NULL, runnerIds=NULL, betIds=NULL, side=NULL,
                              settledDateRange=NULL, groupBy=NULL, includeItemDescription=NULL, locale=NULL,
                              fromRecord=NULL, recordCount=NULL , exchange=.BetfairEnv$exchange,
                              appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  clearedOrders<-r.listClearedOrders(betStatus=betStatus, eventTypeIds=eventTypeIds,
                              eventIds=eventIds, marketIds=marketIds, runnerIds=runnerIds, betIds=betIds,
                              side=side, settledDateRange=settledDateRange, groupBy=groupBy,
                              includeItemDescription=includeItemDescription, locale=locale,
                              fromRecord=fromRecord, recordCount=recordCount , exchange=exchange,
                              appKey=appKey, sessionToken=sessionToken)$result
  
  list(clearedOrders=ldply(clearedOrders$clearedOrders,data.frame,stringsAsFactors = FALSE),
       moreAvailable=clearedOrders$moreAvailable)
}

################################################################################
#' @title placeOrders
#' @description Place new orders into market. LIMIT orders below the minimum bet size are
#' allowed if there is an unmatched bet at the same price in the market. This
#' operation is atomic in that all orders will be placed or none will be placed.
#' 
#' @param   marketId is mandatory of type character.
#'          The market id these orders are to be placed on
#' @param   instructions is mandatory of type ListOfPlaceInstruction.
#'          
#' @param   customerRef is optional of type character.
#'          Optional parameter allowing the client to pass a unique string (up to
#'          32 chars) that is used to de-dupe mistaken re-submissions. 
#' @return  \code{\link{PlaceExecutionReport}}
#' @examples
#' # This is an invalid instruction since the size will not be accepted errorCode:INVALID_BET_SIZE
#' instruction<-PlaceInstruction(selectionId=selectionId,
#'                               handicap=0,
#'                               side=Side('BACK'),
#'                               orderType=OrderType('LIMIT'),
#'                               limitOrder=LimitOrder(size=0.01,price=2,persistenceType=PersistenceType('LAPSE')))
#' 
#' # This should not be placed but it demonstrates the place orders function
#' placeBetResult<-placeOrders(marketId=marketId,
#'                             instructions=ListOfPlaceInstruction(instruction),
#'                             customerRef=format(Sys.time(),"Test-%Y-%m-%dT%H:%M:%S"))
################################################################################
placeOrders<-function(marketId=MarketId(),
                        instructions=ListOfPlaceInstruction(), customerRef=NULL ,
                        exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                        sessionToken=.BetfairEnv$sessionToken) {
  placeExecutionReport<-r.placeOrders(marketId=marketId, instructions=instructions,
                        customerRef=customerRef , exchange=exchange, appKey=appKey,
                        sessionToken=sessionToken)$result
 
  return(list(customerRef=placeExecutionReport$customerRef,
              status=placeExecutionReport$status,
              errorCode=placeExecutionReport$errorCode,
              marketId=placeExecutionReport$marketId,
              instructions=ldply(placeExecutionReport$instructionReports,instruction.report,marketId)
              )
  )
}

################################################################################
#' @title cancelOrders
#' @description Cancel all bets OR cancel all bets on a market OR fully or partially cancel
#' particular orders on a market. Only LIMIT orders an be cancelled or partially
#' cancelled once placed. 
#' @param   marketId is optional of type character.
#'          If not supplied all bets are cancelled
#' @param   instructions is optional of type ListOfCancelInstruction.
#'          All instructions need to be on the same market. If not supplied all
#'          bets on the market (if market id is passed) are fully cancelled 
#' @param   customerRef is optional of type character.
#'          Optional parameter allowing the client to pass a unique string (upto
#'          32 chars) that is used to de-dupe mistaken re-submitions. 
#' @return  \code{\link{CancelExecutionReport}}
################################################################################
cancelOrders<-function(marketId=NULL, instructions=NULL, customerRef=NULL ,
                         exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                         sessionToken=.BetfairEnv$sessionToken) {
  cancelExecutionReport<-r.cancelOrders(marketId=marketId, instructions=instructions,
                         customerRef=customerRef , exchange=exchange, appKey=appKey,
                         sessionToken=sessionToken)$result
  
  return(list(customerRef=cancelExecutionReport$customerRef,
              status=cancelExecutionReport$status,
              errorCode=cancelExecutionReport$errorCode,
              marketId=cancelExecutionReport$marketId,
              instructions=ldply(cancelExecutionReport$instructionReports,instruction.report,marketId)
              )
  )
}

################################################################################
#' @title replaceOrders
#' @description This operation is logically a bulk cancel followed by a bulk place. The
#' cancel is completed first then the new orders are placed. The new orders will
#' be placed atomically in that they will all be placed or none will be placed.
#' In the case where the new orders cannot be placed the cancellations will not
#' be rolled back. See ReplaceInstruction. 
#' @param   marketId is mandatory of type character.
#'          The market id these orders are to be placed on
#' @param   instructions is mandatory of type ListOfReplaceInstruction.
#'          
#' @param   customerRef is optional of type character.
#'          Optional parameter allowing the client to pass a unique string (up to
#'          32 chars) that is used to de-dupe mistaken re-submissions. 
#' @return  \code{\link{ReplaceExecutionReport}}
################################################################################
replaceOrders<-function(marketId=MarketId(),
                          instructions=ListOfReplaceInstruction(), customerRef=NULL ,
                          exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                          sessionToken=.BetfairEnv$sessionToken) {
  replaceExecutionReport<-r.replaceOrders(marketId=marketId, instructions=instructions,
                          customerRef=customerRef , exchange=exchange, appKey=appKey,
                          sessionToken=sessionToken)$result
  
  return(list(customerRef=replaceExecutionReport$customerRef,
              status=replaceExecutionReport$status,
              errorCode=replaceExecutionReport$errorCode,
              marketId=replaceExecutionReport$marketId,
              instructions=ldply(replaceExecutionReport$instructionReports,instruction.report,marketId)
              )
  )
}

################################################################################
#' @title updateOrders
#' @description Update non-exposure changing fields
#' @param   marketId is mandatory of type character.
#'          The market id these orders are to be placed on
#' @param   instructions is mandatory of type ListOfUpdateInstruction.
#'          
#' @param   customerRef is optional of type character.
#'          Optional parameter allowing the client to pass a unique string (up to
#'          32 chars) that is used to de-dupe mistaken re-submissions. 
#' @return \code{\link{UpdateExecutionReport}}
################################################################################
updateOrders<-function(marketId=MarketId(),
                         instructions=ListOfUpdateInstruction(), customerRef=NULL ,
                         exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                         sessionToken=.BetfairEnv$sessionToken) {
  updateExecutionReport<-r.updateOrders(marketId=marketId, instructions=instructions,
                         customerRef=customerRef , exchange=exchange, appKey=appKey,
                         sessionToken=sessionToken)$result
  
  return(list(customerRef=updateExecutionReport$customerRef,
              status=updateExecutionReport$status,
              errorCode=updateExecutionReport$errorCode,
              marketId=updateExecutionReport$marketId,
              instructions=ldply(updateExecutionReport$instructionReports,instruction.report,marketId)
              )
  )
}

################################################################################
#' @title listMarketProfitAndLoss
#' @description Retrieve profit and loss for a given list of markets. The values are
#' calculated using matched bets and optionally settled bets. Only odds markets
#' are implemented, markets of other types are silently ignored. 
#' @param   marketIds is mandatory of type SetOfMarketId.
#'          List of markets to calculate profit and loss
#' @param   includeSettledBets is optional of type logical.
#'          Option to include settled bets (partially settled markets only).
#'          Defaults to false if not specified.
#' @param   includeBspBets is optional of type logical.
#'          Option to include BSP bets. Defaults to false if not specified.
#' @param   netOfCommission is optional of type logical.
#'          Option to return profit and loss net of users current commission rate
#'          for this market including any special tariffs. Defaults to false if
#'          not specified. 
#' @return  \code{\link{MarketProfitAndLoss}}
################################################################################
listMarketProfitAndLoss<-function(marketIds=SetOfMarketId(),
                                    includeSettledBets=NULL, includeBspBets=NULL, netOfCommission=NULL ,
                                    exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                                    sessionToken=.BetfairEnv$sessionToken) {
  pnl<-r.listMarketProfitAndLoss(marketIds=marketIds,
                                    includeSettledBets=includeSettledBets, includeBspBets=includeBspBets,
                                    netOfCommission=netOfCommission , exchange=exchange, appKey=appKey,
                                    sessionToken=sessionToken)$result
  
  list(marketProfitAndLoss=ldply(pnl,marketProfitAndLoss),
       commissionApplied=ldply(pnl,commissionApplied))
}

################################################################################
#' @title heartbeat
#' @description This heartbeat operation is provided to help customers have their positions
#' managed automatically in the event of their API clients losing connectivity
#' with the Betfair API. If a heartbeat request is not received within a
#' prescribed time period, then Betfair will attempt to cancel all 'LIMIT' type
#' bets for the given customer on the given exchange. There is no guarantee that
#' this service will result in all bets being cancelled as there are a number of
#' circumstances where bets are unable to be cancelled. Manual intervention is
#' strongly advised in the event of a loss of connectivity to ensure that
#' positions are correctly managed. If this service becomes unavailable for any
#' reason, then your heartbeat will be unregistered automatically to avoid bets
#' being inadvertently cancelled upon resumption of service. you should manage
#' your position manually until the service is resumed. Heartbeat data may also
#' be lost in the unlikely event of nodes failing within the cluster, which may
#' result in your position not being managed until a subsequent heartbeat
#' request is received. 
#' @param   preferredTimeoutSeconds is mandatory of type integer.
#'          Maximum period in seconds that may elapse (without a subsequent
#'          heartbeat request), before a cancellation request is automatically
#'          submitted on your behalf. Passing 0 will result in your heartbeat
#'          being unregistered (or ignored if you have no current heartbeat
#'          registered). You will still get an actionPerformed value returned when
#'          passing 0, so this may be used to determine if any action was
#'          performed since your last heartbeat, without actually registering a
#'          new heartbeat. Passing a negative value will result in an error being
#'          returned, INVALID_INPUT_DATA. Any errors while registering your
#'          heartbeat will result in a error being returned, UNEXPECTED_ERROR.
#'          Passing a value that is less than the minimum timeout will result in
#'          your heartbeat adopting the minimum timeout. Passing a value that is
#'          greater than the maximum timeout will result in your heartbeat
#'          adopting the maximum timeout. The minimum and maximum timeouts are
#'          subject to change, so your client should utilise the returned
#'          actualTimeoutSeconds to set an appropriate frequency for your
#'          subsequent heartbeat requests. 
#' @return  Response from heartbeat operation \code{\link{HeartbeatReport}}
################################################################################
heartbeat<-function(preferredTimeoutSeconds=0 ,
                      exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                      sessionToken=.BetfairEnv$sessionToken) {
  heartbeatReport<-r.heartbeat(preferredTimeoutSeconds=preferredTimeoutSeconds ,
                      exchange=exchange, appKey=appKey, sessionToken=sessionToken)$result
  heartbeatReport
}

################################################################################
#' @title createDeveloperAppKeys
#' @description Create 2 application keys for given user; one active and the other delayed 
#' @param   appName is mandatory of type character.
#'          A Display name for the application. 
#' @return  A map of application keys, one marked ACTIVE, and the other DELAYED 
#' \code{\link{DeveloperApp}}
################################################################################
createDeveloperAppKeys<-function(appName=string() ,
                                   exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                                   sessionToken=.BetfairEnv$sessionToken) {
  developerApp<-r.createDeveloperAppKeys(appName=appName , exchange=exchange,
                                   appKey=appKey, sessionToken=sessionToken)$result
  list(appName=developerApp$appName,
       appId=developerApp$appId,
       keys=ldply(developerApp$appVersions,data.frame,stringsAsFactors = FALSE))
}

################################################################################
#' @title getDeveloperAppKeys
#' @description Get all application keys owned by the given developer/vendor 
#' @return  A list of application keys owned by the given developer/vendor 
#' \code{\link{DeveloperApp}}
################################################################################
getDeveloperAppKeys<-function(exchange=.BetfairEnv$exchange,
                                appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  developerAppKeys<-r.getDeveloperAppKeys(exchange=exchange, appKey=appKey,
                                sessionToken=sessionToken)$result
  list(apps=ldply(developerAppKeys,dev.app),
       keys=ldply(developerAppKeys,dev.keys))
}

################################################################################
#' @title getAccountFunds
#' @description Get available to bet amount. 
#' @return  Response for retrieving available to bet. 
#' \code{\link{AccountFundsResponse}}
################################################################################
getAccountFunds<-function(exchange=.BetfairEnv$exchange,
                            appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  accountFunds<-r.getAccountFunds(exchange=exchange, appKey=appKey,
                            sessionToken=sessionToken)$result
  data.frame(accountFunds,stringsAsFactors = FALSE)
}

################################################################################
#' @title getAccountDetails
#' @description Get Account details. 
#' @return  Response for retrieving account details. 
#' \code{\link{AccountDetailsResponse}}
################################################################################
getAccountDetails<-function(exchange=.BetfairEnv$exchange,
                              appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  accountDetails<-r.getAccountDetails(exchange=exchange, appKey=appKey,
                              sessionToken=sessionToken)$result
  data.frame(accountDetails,stringsAsFactors = FALSE)
}

################################################################################
#' @title getVendorClientId
#' @description Get vendor client id for customer account. 
#' @return  Vendor client id. 
################################################################################
getVendorClientId<-function(exchange=.BetfairEnv$exchange,
                              appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  vendorClientId<-r.getVendorClientId(exchange=exchange, appKey=appKey,
                              sessionToken=sessionToken)$result
  vendorClientId
}

################################################################################
#' @title getApplicationSubscriptionToken
#' @description Returns the newly generate subscription token 
#' @param   subscriptionLength is optional of type integer.
#'          How many days the subscription should last. Open ended if value not
#'          supplied. Expiry time will be rounded up to midnight on the date of
#'          expiry. 
#' @param   clientReference is optional of type character.
#'          Any client reference for this subscription token request.
#' @return  Subscription token 
################################################################################
getApplicationSubscriptionToken<-function(subscriptionLength=NULL,
                                            clientReference=NULL , exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                                            sessionToken=.BetfairEnv$sessionToken) {
  applicationSubscriptionToken<-r.getApplicationSubscriptionToken(subscriptionLength=subscriptionLength,
                                            clientReference=clientReference , exchange=exchange, appKey=appKey,
                                            sessionToken=sessionToken)$result
  applicationSubscriptionToken
}

################################################################################
#' @title activateApplicationSubscription
#' @description Activate the subscription token for the customer 
#' @param   subscriptionToken is mandatory of type character.
#'          Subscription token for activation 
#' @return \code{\link{Status}}
################################################################################
activateApplicationSubscription<-function(subscriptionToken=string() ,
                                            exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                                            sessionToken=.BetfairEnv$sessionToken) {
  status<-r.activateApplicationSubscription(subscriptionToken=subscriptionToken ,
                                            exchange=exchange, appKey=appKey, sessionToken=sessionToken)$result
  status
}

################################################################################
#' @title cancelApplicationSubscription
#' @description Cancel application subscription 
#' @param   subscriptionToken is mandatory of type character.
#'          Subscription token to cancel 
#' @return \code{\link{Status}}
################################################################################
cancelApplicationSubscription<-function(subscriptionToken=string() ,
                                          exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                                          sessionToken=.BetfairEnv$sessionToken) {
  status<-r.cancelApplicationSubscription(subscriptionToken=subscriptionToken ,
                                          exchange=exchange, appKey=appKey, sessionToken=sessionToken)$result
  status
}

################################################################################
#' @title listApplicationSubscriptionTokens
#' @description List of subscription tokens for an application 
#' @param   subscriptionStatus is optional of type SubscriptionStatus.
#'          Optionally filter response by Subscription status of the token 
#' @return  List of subscription tokens for an application 
#' \code{\link{ApplicationSubscription}}
################################################################################
listApplicationSubscriptionTokens<-function(subscriptionStatus=NULL ,
                                              exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                                              sessionToken=.BetfairEnv$sessionToken) {
  applicationSubscriptionTokens<-r.listApplicationSubscriptionTokens(subscriptionStatus=subscriptionStatus
                                              , exchange=exchange, appKey=appKey, sessionToken=sessionToken)$result
  applicationSubscriptionTokens
}

################################################################################
#' @title listAccountSubscriptionTokens
#' @description List of subscription tokens associated with the account 
#' @return  List of subscription tokens associated with the account 
#' \code{\link{AccountSubscription}}
################################################################################
listAccountSubscriptionTokens<-function(exchange=.BetfairEnv$exchange,
                                          appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  accountSubscriptionTokens<-r.listAccountSubscriptionTokens( exchange=exchange, appKey=appKey,
                                          sessionToken=sessionToken)$result
  accountSubscriptionTokens
}

################################################################################
#' @title getApplicationSubscriptionHistory
#' @description Identify multiple subscriptions for single customer, operation can be used by
#' vendors and clients. ApplicationKey has to be passed in the body or header
#' but not both. 
#' @param   vendorClientId is mandatory of type character.
#'          Vendor client id
#' @param   applicationKey is optional of type character.
#'          Vendor application key
#' @return  List of subscription tokens associated with the account 
#' \code{\link{SubscriptionHistory}}
################################################################################
getApplicationSubscriptionHistory<-function(vendorClientId=string(),
                                              applicationKey=NULL , exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                                              sessionToken=.BetfairEnv$sessionToken) {
  applicationSubscriptionHistory<-r.getApplicationSubscriptionHistory(vendorClientId=vendorClientId,
                                              applicationKey=applicationKey , exchange=exchange, appKey=appKey,
                                              sessionToken=sessionToken)$result
  applicationSubscriptionHistory
}

################################################################################
#' @title getAccountStatement
#' @description Get account statement 
#' @param   locale is optional of type character.
#'          The language to be used where applicable. If not specified, the
#'          customer account default is returned. 
#' @param   fromRecord is optional of type integer.
#'          Specifies the first record that will be returned. Records start at
#'          index zero. If not specified then it will default to 0. 
#' @param   recordCount is optional of type integer.
#'          Specifies the maximum number of records to be returned. Note that
#'          there is a page size limit of 100. If not specified then it will
#'          default to the page limit size. 
#' @param   itemDateRange is optional of type TimeRange.
#'          Return items with an itemDate within this date range. Both from and to
#'          date times are inclusive. If from is not specified then the oldest
#'          available items will be in range. If to is not specified then the
#'          latest items will be in range. nb. This itemDataRange is currently
#'          only applied when includeItem is set to ALL or not specified, else
#'          items are NOT bound by itemDate. 
#' @param   includeItem is optional of type IncludeItem.
#'          Which items to include, if not specified then defaults to ALL. 
#' @param   wallet is optional of type Wallet.
#'          Which wallet to return statementItems for. If unspecified then the UK
#'          wallet will be selected 
#' @return  List of statement items chronologically ordered plus moreAvailable
#'          boolean to facilitate paging 
#'          \code{\link{AccountStatementReport}}
################################################################################
getAccountStatement<-function(locale=NULL, fromRecord=NULL, recordCount=NULL,
                                itemDateRange=NULL, includeItem=NULL, wallet=NULL ,
                                exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
                                sessionToken=.BetfairEnv$sessionToken) {
  accountStatement<-r.getAccountStatement(locale=locale, fromRecord=fromRecord,
                                recordCount=recordCount, itemDateRange=itemDateRange, includeItem=includeItem,
                                wallet=wallet , exchange=exchange, appKey=appKey, sessionToken=sessionToken)$result
  accountStatement
}

################################################################################
#' @title listCurrencyRates
#' @description Returns a list of currency rates based on given currency 
#' @param   fromCurrency is optional of type character.
#'          The currency from which the rates are computed. GBP is used if no
#'          value is passed
#' @return  List of currency rates \code{\link{CurrencyRate}}
################################################################################
listCurrencyRates<-function(fromCurrency=NULL , exchange=.BetfairEnv$exchange,
                              appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  currencyRates<-r.listCurrencyRates(fromCurrency=fromCurrency , exchange=exchange,
                              appKey=appKey, sessionToken=sessionToken)$result
  ldply(currencyRates,data.frame,stringsAsFactors = FALSE)
}
