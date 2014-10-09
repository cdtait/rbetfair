################################################################################
#  Interface:   SportsAPING
#  Description: APING
#  Version:     1.0.0
#  Owner:       BDP
#  Date:        now()
#  Generated:   08-Oct-2014
################################################################################

################################################################################
#' @title MarketProjection
#' @description MarketProjection
#' @usage MarketProjection(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     COMPETITION
#'            If not selected then the competition will not be returned with
#'            marketCatalogue 
#'     }
#'     \item {     EVENT
#'            If not selected then the event will not be returned with
#'            marketCatalogue
#'     }
#'     \item {     EVENT_TYPE
#'            If not selected then the eventType will not be returned with
#'            marketCatalogue
#'     }
#'     \item {     MARKET_START_TIME
#'            If not selected then the start time will not be returned with
#'            marketCatalogue 
#'     }
#'     \item {     MARKET_DESCRIPTION
#'            If not selected then the description will not be returned with
#'            marketCatalogue 
#'     }
#'     \item {     RUNNER_DESCRIPTION
#'            If not selected then the runners will not be returned with
#'            marketCatalogue
#'     }
#'     \item {     RUNNER_METADATA
#'            If not selected then the runner metadata will not be returned with
#'            marketCatalogue. If selected then RUNNER_DESCRIPTION will also be
#'            returned regardless of whether it is included as a market projection. 
#'     }
#'   }
#' }
################################################################################
MarketProjectionValidValues=c("COMPETITION","EVENT","EVENT_TYPE","MARKET_START_TIME","MARKET_DESCRIPTION","RUNNER_DESCRIPTION","RUNNER_METADATA")
MarketProjection<-function(values) {
  validateSet(values,'MarketProjection',MarketProjectionValidValues)
  class(values) <- append(class(values),"MarketProjection")
  return(values)
}
SetOfMarketProjection<-function(...) { SetOfV(list(...),'MarketProjection',MarketProjectionValidValues) }
ListOfMarketProjection<-function(...) { ListOfV(list(...),'MarketProjection',MarketProjectionValidValues) }

################################################################################
#' @title PriceData
#' @description PriceData
#' @usage PriceData(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     SP_AVAILABLE
#'     }
#'     \item {     SP_TRADED
#'     }
#'     \item {     EX_BEST_OFFERS
#'     }
#'     \item {     EX_ALL_OFFERS
#'            EX_ALL_OFFERS trumps EX_BEST_OFFERS if both settings are present
#'     }
#'     \item {     EX_TRADED
#'     }
#'   }
#' }
################################################################################
PriceDataValidValues=c("SP_AVAILABLE","SP_TRADED","EX_BEST_OFFERS","EX_ALL_OFFERS","EX_TRADED")
PriceData<-function(values) {
  validateSet(values,'PriceData',PriceDataValidValues)
  class(values) <- append(class(values),"PriceData")
  return(values)
}
SetOfPriceData<-function(...) { SetOfV(list(...),'PriceData',PriceDataValidValues) }
ListOfPriceData<-function(...) { ListOfV(list(...),'PriceData',PriceDataValidValues) }

################################################################################
#' @title MatchProjection
#' @description MatchProjection
#' @usage MatchProjection(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     NO_ROLLUP
#'     }
#'     \item {     ROLLED_UP_BY_PRICE
#'     }
#'     \item {     ROLLED_UP_BY_AVG_PRICE
#'     }
#'   }
#' }
################################################################################
MatchProjectionValidValues=c("NO_ROLLUP","ROLLED_UP_BY_PRICE","ROLLED_UP_BY_AVG_PRICE")
MatchProjection<-function(values) {
  validateSet(values,'MatchProjection',MatchProjectionValidValues)
  class(values) <- append(class(values),"MatchProjection")
  return(values)
}
SetOfMatchProjection<-function(...) { SetOfV(list(...),'MatchProjection',MatchProjectionValidValues) }
ListOfMatchProjection<-function(...) { ListOfV(list(...),'MatchProjection',MatchProjectionValidValues) }

################################################################################
#' @title OrderProjection
#' @description OrderProjection
#' @usage OrderProjection(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     ALL
#'     }
#'     \item {     EXECUTABLE
#'     }
#'     \item {     EXECUTION_COMPLETE
#'     }
#'   }
#' }
################################################################################
OrderProjectionValidValues=c("ALL","EXECUTABLE","EXECUTION_COMPLETE")
OrderProjection<-function(values) {
  validateSet(values,'OrderProjection',OrderProjectionValidValues)
  class(values) <- append(class(values),"OrderProjection")
  return(values)
}
SetOfOrderProjection<-function(...) { SetOfV(list(...),'OrderProjection',OrderProjectionValidValues) }
ListOfOrderProjection<-function(...) { ListOfV(list(...),'OrderProjection',OrderProjectionValidValues) }

################################################################################
#' @title MarketStatus
#' @description MarketStatus
#' @usage MarketStatus(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     INACTIVE
#'            Inactive Market
#'     }
#'     \item {     OPEN
#'            Open Market
#'     }
#'     \item {     SUSPENDED
#'            Suspended Market
#'     }
#'     \item {     CLOSED
#'            Closed Market
#'     }
#'   }
#' }
################################################################################
MarketStatusValidValues=c("INACTIVE","OPEN","SUSPENDED","CLOSED")
MarketStatus<-function(values) {
  validateSet(values,'MarketStatus',MarketStatusValidValues)
  class(values) <- append(class(values),"MarketStatus")
  return(values)
}
SetOfMarketStatus<-function(...) { SetOfV(list(...),'MarketStatus',MarketStatusValidValues) }
ListOfMarketStatus<-function(...) { ListOfV(list(...),'MarketStatus',MarketStatusValidValues) }

################################################################################
#' @title RunnerStatus
#' @description RunnerStatus
#' @usage RunnerStatus(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     ACTIVE
#'            ACTIVE
#'     }
#'     \item {     WINNER
#'            WINNER
#'     }
#'     \item {     LOSER
#'            LOSER
#'     }
#'     \item {     REMOVED_VACANT
#'     }
#'     \item {     REMOVED
#'            REMOVED
#'     }
#'   }
#' }
################################################################################
RunnerStatusValidValues=c("ACTIVE","WINNER","LOSER","REMOVED_VACANT","REMOVED")
RunnerStatus<-function(values) {
  validateSet(values,'RunnerStatus',RunnerStatusValidValues)
  class(values) <- append(class(values),"RunnerStatus")
  return(values)
}
SetOfRunnerStatus<-function(...) { SetOfV(list(...),'RunnerStatus',RunnerStatusValidValues) }
ListOfRunnerStatus<-function(...) { ListOfV(list(...),'RunnerStatus',RunnerStatusValidValues) }

################################################################################
#' @title TimeGranularity
#' @description TimeGranularity
#' @usage TimeGranularity(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     DAYS
#'     }
#'     \item {     HOURS
#'     }
#'     \item {     MINUTES
#'     }
#'   }
#' }
################################################################################
TimeGranularityValidValues=c("DAYS","HOURS","MINUTES")
TimeGranularity<-function(values) {
  validateSet(values,'TimeGranularity',TimeGranularityValidValues)
  class(values) <- append(class(values),"TimeGranularity")
  return(values)
}
SetOfTimeGranularity<-function(...) { SetOfV(list(...),'TimeGranularity',TimeGranularityValidValues) }
ListOfTimeGranularity<-function(...) { ListOfV(list(...),'TimeGranularity',TimeGranularityValidValues) }

################################################################################
#' @title MarketType
#' @description MarketType
#' @usage MarketType(values)
#' @param values Any of following valid values
################################################################################
MarketType<-string
SetOfMarketType<-function(...) { SetOf(list(...),'MarketType') }
ListOfMarketType<-function(...) { ListOf(list(...),'MarketType') }

################################################################################
#' @title Venue
#' @description Venue
#' @usage Venue(values)
#' @param values Any of following valid values
################################################################################
Venue<-string
SetOfVenue<-function(...) { SetOf(list(...),'Venue') }
ListOfVenue<-function(...) { ListOf(list(...),'Venue') }

################################################################################
#' @title MarketId
#' @description MarketId
#' @usage MarketId(values)
#' @param values Any of following valid values
################################################################################
MarketId<-string
SetOfMarketId<-function(...) { SetOf(list(...),'MarketId') }
ListOfMarketId<-function(...) { ListOf(list(...),'MarketId') }

################################################################################
#' @title SelectionId
#' @description SelectionId
#' @usage SelectionId(values)
#' @param values Any of following valid values
################################################################################
SelectionId<-i64
SetOfSelectionId<-function(...) { SetOf(list(...),'SelectionId') }
ListOfSelectionId<-function(...) { ListOf(list(...),'SelectionId') }

################################################################################
#' @title Handicap
#' @description Handicap
#' @usage Handicap(values)
#' @param values Any of following valid values
################################################################################
Handicap<-double
SetOfHandicap<-function(...) { SetOf(list(...),'Handicap') }
ListOfHandicap<-function(...) { ListOf(list(...),'Handicap') }

################################################################################
#' @title EventId
#' @description EventId
#' @usage EventId(values)
#' @param values Any of following valid values
################################################################################
EventId<-string
SetOfEventId<-function(...) { SetOf(list(...),'EventId') }
ListOfEventId<-function(...) { ListOf(list(...),'EventId') }

################################################################################
#' @title EventTypeId
#' @description EventTypeId
#' @usage EventTypeId(values)
#' @param values Any of following valid values
################################################################################
EventTypeId<-string
SetOfEventTypeId<-function(...) { SetOf(list(...),'EventTypeId') }
ListOfEventTypeId<-function(...) { ListOf(list(...),'EventTypeId') }

################################################################################
#' @title CountryCode
#' @description CountryCode
#' @usage CountryCode(values)
#' @param values Any of following valid values
################################################################################
CountryCode<-string
SetOfCountryCode<-function(...) { SetOf(list(...),'CountryCode') }
ListOfCountryCode<-function(...) { ListOf(list(...),'CountryCode') }

################################################################################
#' @title ExchangeId
#' @description ExchangeId
#' @usage ExchangeId(values)
#' @param values Any of following valid values
################################################################################
ExchangeId<-string
SetOfExchangeId<-function(...) { SetOf(list(...),'ExchangeId') }
ListOfExchangeId<-function(...) { ListOf(list(...),'ExchangeId') }

################################################################################
#' @title CompetitionId
#' @description CompetitionId
#' @usage CompetitionId(values)
#' @param values Any of following valid values
################################################################################
CompetitionId<-string
SetOfCompetitionId<-function(...) { SetOf(list(...),'CompetitionId') }
ListOfCompetitionId<-function(...) { ListOf(list(...),'CompetitionId') }

################################################################################
#' @title Price
#' @description Price
#' @usage Price(values)
#' @param values Any of following valid values
################################################################################
Price<-double
SetOfPrice<-function(...) { SetOf(list(...),'Price') }
ListOfPrice<-function(...) { ListOf(list(...),'Price') }

################################################################################
#' @title Size
#' @description Size
#' @usage Size(values)
#' @param values Any of following valid values
################################################################################
Size<-double
SetOfSize<-function(...) { SetOf(list(...),'Size') }
ListOfSize<-function(...) { ListOf(list(...),'Size') }

################################################################################
#' @title BetId
#' @description BetId
#' @usage BetId(values)
#' @param values Any of following valid values
################################################################################
BetId<-string
SetOfBetId<-function(...) { SetOf(list(...),'BetId') }
ListOfBetId<-function(...) { ListOf(list(...),'BetId') }

################################################################################
#' @title MatchId
#' @description MatchId
#' @usage MatchId(values)
#' @param values Any of following valid values
################################################################################
MatchId<-string
SetOfMatchId<-function(...) { SetOf(list(...),'MatchId') }
ListOfMatchId<-function(...) { ListOf(list(...),'MatchId') }

################################################################################
#' @title Side
#' @description Side
#' @usage Side(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     BACK
#'            To back a team, horse or outcome is to bet on the selection to win.
#'     }
#'     \item {     LAY
#'            To lay a team, horse, or outcome is to bet on the selection to lose.
#'     }
#'   }
#' }
################################################################################
SideValidValues=c("BACK","LAY")
Side<-function(values) {
  validateSet(values,'Side',SideValidValues)
  class(values) <- append(class(values),"Side")
  return(values)
}
SetOfSide<-function(...) { SetOfV(list(...),'Side',SideValidValues) }
ListOfSide<-function(...) { ListOfV(list(...),'Side',SideValidValues) }

################################################################################
#' @title OrderStatus
#' @description OrderStatus
#' @usage OrderStatus(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     EXECUTION_COMPLETE
#'            An order that does not have any remaining unmatched portion.
#'     }
#'     \item {     EXECUTABLE
#'            An order that has a remaining unmatched portion.
#'     }
#'   }
#' }
################################################################################
OrderStatusValidValues=c("EXECUTION_COMPLETE","EXECUTABLE")
OrderStatus<-function(values) {
  validateSet(values,'OrderStatus',OrderStatusValidValues)
  class(values) <- append(class(values),"OrderStatus")
  return(values)
}
SetOfOrderStatus<-function(...) { SetOfV(list(...),'OrderStatus',OrderStatusValidValues) }
ListOfOrderStatus<-function(...) { ListOfV(list(...),'OrderStatus',OrderStatusValidValues) }

################################################################################
#' @title OrderBy
#' @description OrderBy
#' @usage OrderBy(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     BY_BET
#'            Deprecated Use BY_PLACE_TIME instead. Order by placed time, then bet
#'            id.
#'     }
#'     \item {     BY_MARKET
#'            Order by market id, then placed time, then bet id.
#'     }
#'     \item {     BY_PLACE_TIME
#'            Order by placed time, then bet id. This is an alias of to be
#'            deprecated BY_BET. 
#'     }
#'     \item {     BY_MATCH_TIME
#'            Order by time of last matched fragment (if any), then placed time,
#'            then bet id. Filters out orders which have no matched date 
#'     }
#'     \item {     BY_VOID_TIME
#'            Order by time of last voided fragment (if any), then by last match
#'            time, then placed time, then bet id. Filters out orders which have not
#'            been voided. 
#'     }
#'     \item {     BY_SETTLED_TIME
#'            Order by time of last settled fragment (if any), then by last match
#'            time, then placed time, then bet id. Filters out orders which have not
#'            been settled. 
#'     }
#'   }
#' }
################################################################################
OrderByValidValues=c("BY_BET","BY_MARKET","BY_PLACE_TIME","BY_MATCH_TIME","BY_VOID_TIME","BY_SETTLED_TIME")
OrderBy<-function(values) {
  validateSet(values,'OrderBy',OrderByValidValues)
  class(values) <- append(class(values),"OrderBy")
  return(values)
}
SetOfOrderBy<-function(...) { SetOfV(list(...),'OrderBy',OrderByValidValues) }
ListOfOrderBy<-function(...) { ListOfV(list(...),'OrderBy',OrderByValidValues) }

################################################################################
#' @title SortDir
#' @description SortDir
#' @usage SortDir(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     EARLIEST_TO_LATEST
#'            Order from earliest value to latest e.g. lowest betId is first in the
#'            results. 
#'     }
#'     \item {     LATEST_TO_EARLIEST
#'            Order from the latest value to the earliest e.g. highest betId is
#'            first in the results. 
#'     }
#'   }
#' }
################################################################################
SortDirValidValues=c("EARLIEST_TO_LATEST","LATEST_TO_EARLIEST")
SortDir<-function(values) {
  validateSet(values,'SortDir',SortDirValidValues)
  class(values) <- append(class(values),"SortDir")
  return(values)
}
SetOfSortDir<-function(...) { SetOfV(list(...),'SortDir',SortDirValidValues) }
ListOfSortDir<-function(...) { ListOfV(list(...),'SortDir',SortDirValidValues) }

################################################################################
#' @title OrderType
#' @description OrderType
#' @usage OrderType(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     LIMIT
#'            A normal exchange limit order for immediate execution
#'     }
#'     \item {     LIMIT_ON_CLOSE
#'            Limit order for the auction (SP)
#'     }
#'     \item {     MARKET_ON_CLOSE
#'            Market order for the auction (SP)
#'     }
#'   }
#' }
################################################################################
OrderTypeValidValues=c("LIMIT","LIMIT_ON_CLOSE","MARKET_ON_CLOSE")
OrderType<-function(values) {
  validateSet(values,'OrderType',OrderTypeValidValues)
  class(values) <- append(class(values),"OrderType")
  return(values)
}
SetOfOrderType<-function(...) { SetOfV(list(...),'OrderType',OrderTypeValidValues) }
ListOfOrderType<-function(...) { ListOfV(list(...),'OrderType',OrderTypeValidValues) }

################################################################################
#' @title MarketSort
#' @description MarketSort
#' @usage MarketSort(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     MINIMUM_TRADED
#'            Minimum traded volume
#'     }
#'     \item {     MAXIMUM_TRADED
#'            Maximum traded volume
#'     }
#'     \item {     MINIMUM_AVAILABLE
#'            Minimum available to match
#'     }
#'     \item {     MAXIMUM_AVAILABLE
#'            Maximum available to match
#'     }
#'     \item {     FIRST_TO_START
#'            The closest markets based on their expected start time
#'     }
#'     \item {     LAST_TO_START
#'            The most distant markets based on their expected start time
#'     }
#'   }
#' }
################################################################################
MarketSortValidValues=c("MINIMUM_TRADED","MAXIMUM_TRADED","MINIMUM_AVAILABLE","MAXIMUM_AVAILABLE","FIRST_TO_START","LAST_TO_START")
MarketSort<-function(values) {
  validateSet(values,'MarketSort',MarketSortValidValues)
  class(values) <- append(class(values),"MarketSort")
  return(values)
}
SetOfMarketSort<-function(...) { SetOfV(list(...),'MarketSort',MarketSortValidValues) }
ListOfMarketSort<-function(...) { ListOfV(list(...),'MarketSort',MarketSortValidValues) }

################################################################################
#' @title MarketBettingType
#' @description MarketBettingType
#' @usage MarketBettingType(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     ODDS
#'            Odds Market
#'     }
#'     \item {     LINE
#'            Line Market
#'     }
#'     \item {     RANGE
#'            Range Market
#'     }
#'     \item {     ASIAN_HANDICAP_DOUBLE_LINE
#'            Asian Handicap Market
#'     }
#'     \item {     ASIAN_HANDICAP_SINGLE_LINE
#'            Asian Single Line Market
#'     }
#'     \item {     FIXED_ODDS
#'            Sportsbook Odds Market. This type is deprecated and will be removed in
#'            future releases, when Sportsbook markets will be represented as ODDS
#'            market but with a different product type. 
#'     }
#'   }
#' }
################################################################################
MarketBettingTypeValidValues=c("ODDS","LINE","RANGE","ASIAN_HANDICAP_DOUBLE_LINE","ASIAN_HANDICAP_SINGLE_LINE","FIXED_ODDS")
MarketBettingType<-function(values) {
  validateSet(values,'MarketBettingType',MarketBettingTypeValidValues)
  class(values) <- append(class(values),"MarketBettingType")
  return(values)
}
SetOfMarketBettingType<-function(...) { SetOfV(list(...),'MarketBettingType',MarketBettingTypeValidValues) }
ListOfMarketBettingType<-function(...) { ListOfV(list(...),'MarketBettingType',MarketBettingTypeValidValues) }

################################################################################
#' @title ExecutionReportStatus
#' @description ExecutionReportStatus
#' @usage ExecutionReportStatus(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     SUCCESS
#'     }
#'     \item {     FAILURE
#'     }
#'     \item {     PROCESSED_WITH_ERRORS
#'     }
#'     \item {     TIMEOUT
#'     }
#'   }
#' }
################################################################################
ExecutionReportStatusValidValues=c("SUCCESS","FAILURE","PROCESSED_WITH_ERRORS","TIMEOUT")
ExecutionReportStatus<-function(values) {
  validateSet(values,'ExecutionReportStatus',ExecutionReportStatusValidValues)
  class(values) <- append(class(values),"ExecutionReportStatus")
  return(values)
}
SetOfExecutionReportStatus<-function(...) { SetOfV(list(...),'ExecutionReportStatus',ExecutionReportStatusValidValues) }
ListOfExecutionReportStatus<-function(...) { ListOfV(list(...),'ExecutionReportStatus',ExecutionReportStatusValidValues) }

################################################################################
#' @title ExecutionReportErrorCode
#' @description ExecutionReportErrorCode
#' @usage ExecutionReportErrorCode(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     ERROR_IN_MATCHER
#'            The matcher's not healthy
#'     }
#'     \item {     PROCESSED_WITH_ERRORS
#'            The order itself has been accepted, but at least one (possibly all)
#'            actions have generated errors 
#'     }
#'     \item {     BET_ACTION_ERROR
#'            There is an error with an action that has caused the entire order to
#'            be rejected 
#'     }
#'     \item {     INVALID_ACCOUNT_STATE
#'            Order rejected due to the account's status (suspended, inactive, dup
#'            cards)
#'     }
#'     \item {     INVALID_WALLET_STATUS
#'            Order rejected due to the account's wallet's status
#'     }
#'     \item {     INSUFFICIENT_FUNDS
#'            Account has exceeded its exposure limit or available to bet limit
#'     }
#'     \item {     LOSS_LIMIT_EXCEEDED
#'            The account has exceed the self imposed loss limit
#'     }
#'     \item {     MARKET_SUSPENDED
#'            Market is suspended
#'     }
#'     \item {     MARKET_NOT_OPEN_FOR_BETTING
#'            Market is not open for betting, either inactive, suspended or closed
#'     }
#'     \item {     DUPLICATE_TRANSACTION
#'            duplicate customer referece data submitted
#'     }
#'     \item {     INVALID_ORDER
#'            Order cannot be accepted by the matcher due to the combination of
#'            actions. For example, bets being edited are not on the same market, or
#'            order includes both edits and placement 
#'     }
#'     \item {     INVALID_MARKET_ID
#'            Market doesn't exist
#'     }
#'     \item {     PERMISSION_DENIED
#'            Business rules do not allow order to be placed
#'     }
#'     \item {     DUPLICATE_BETIDS
#'            duplicate bet ids found
#'     }
#'     \item {     NO_ACTION_REQUIRED
#'            Order hasn't been passed to matcher as system detected there will be
#'            no state change 
#'     }
#'     \item {     SERVICE_UNAVAILABLE
#'            The requested service is unavailable
#'     }
#'     \item {     REJECTED_BY_REGULATOR
#'            The regulator rejected the order
#'     }
#'   }
#' }
################################################################################
ExecutionReportErrorCodeValidValues=c("ERROR_IN_MATCHER","PROCESSED_WITH_ERRORS","BET_ACTION_ERROR","INVALID_ACCOUNT_STATE","INVALID_WALLET_STATUS","INSUFFICIENT_FUNDS","LOSS_LIMIT_EXCEEDED","MARKET_SUSPENDED","MARKET_NOT_OPEN_FOR_BETTING","DUPLICATE_TRANSACTION","INVALID_ORDER","INVALID_MARKET_ID","PERMISSION_DENIED","DUPLICATE_BETIDS","NO_ACTION_REQUIRED","SERVICE_UNAVAILABLE","REJECTED_BY_REGULATOR")
ExecutionReportErrorCode<-function(values) {
  validateSet(values,'ExecutionReportErrorCode',ExecutionReportErrorCodeValidValues)
  class(values) <- append(class(values),"ExecutionReportErrorCode")
  return(values)
}
SetOfExecutionReportErrorCode<-function(...) { SetOfV(list(...),'ExecutionReportErrorCode',ExecutionReportErrorCodeValidValues) }
ListOfExecutionReportErrorCode<-function(...) { ListOfV(list(...),'ExecutionReportErrorCode',ExecutionReportErrorCodeValidValues) }

################################################################################
#' @title PersistenceType
#' @description PersistenceType
#' @usage PersistenceType(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     LAPSE
#'            Lapse the order at turn-in-play
#'     }
#'     \item {     PERSIST
#'            Persist the order to in-play
#'     }
#'     \item {     MARKET_ON_CLOSE
#'            Put the order into the auction (SP) at turn-in-play
#'     }
#'   }
#' }
################################################################################
PersistenceTypeValidValues=c("LAPSE","PERSIST","MARKET_ON_CLOSE")
PersistenceType<-function(values) {
  validateSet(values,'PersistenceType',PersistenceTypeValidValues)
  class(values) <- append(class(values),"PersistenceType")
  return(values)
}
SetOfPersistenceType<-function(...) { SetOfV(list(...),'PersistenceType',PersistenceTypeValidValues) }
ListOfPersistenceType<-function(...) { ListOfV(list(...),'PersistenceType',PersistenceTypeValidValues) }

################################################################################
#' @title InstructionReportStatus
#' @description InstructionReportStatus
#' @usage InstructionReportStatus(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     SUCCESS
#'     }
#'     \item {     FAILURE
#'     }
#'     \item {     TIMEOUT
#'     }
#'   }
#' }
################################################################################
InstructionReportStatusValidValues=c("SUCCESS","FAILURE","TIMEOUT")
InstructionReportStatus<-function(values) {
  validateSet(values,'InstructionReportStatus',InstructionReportStatusValidValues)
  class(values) <- append(class(values),"InstructionReportStatus")
  return(values)
}
SetOfInstructionReportStatus<-function(...) { SetOfV(list(...),'InstructionReportStatus',InstructionReportStatusValidValues) }
ListOfInstructionReportStatus<-function(...) { ListOfV(list(...),'InstructionReportStatus',InstructionReportStatusValidValues) }

################################################################################
#' @title InstructionReportErrorCode
#' @description InstructionReportErrorCode
#' @usage InstructionReportErrorCode(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     INVALID_BET_SIZE
#'            Bet size is invalid for your currency or your regulator
#'     }
#'     \item {     INVALID_RUNNER
#'            Runner does not exist, includes vacant traps in greyhound racing
#'     }
#'     \item {     BET_TAKEN_OR_LAPSED
#'            Bet cannot be cancelled or modified as it has already been taken or
#'            has lapsed Includes attempts to cancel/modify market on close BSP bets
#'            and cancelling limit on close BSP bets 
#'     }
#'     \item {     BET_IN_PROGRESS
#'            No result was received from the matcher in a timeout configured for
#'            the system 
#'     }
#'     \item {     RUNNER_REMOVED
#'            Runner has been removed from the event
#'     }
#'     \item {     MARKET_NOT_OPEN_FOR_BETTING
#'            Attempt to edit a bet on a market that has closed.
#'     }
#'     \item {     LOSS_LIMIT_EXCEEDED
#'            The action has caused the account to exceed the self imposed loss
#'            limit
#'     }
#'     \item {     MARKET_NOT_OPEN_FOR_BSP_BETTING
#'            Market now closed to bsp betting. Turned in-play or has been
#'            reconciled
#'     }
#'     \item {     INVALID_PRICE_EDIT
#'            Attempt to edit down the price of a bsp limit on close lay bet, or
#'            edit up the price of a limit on close back bet 
#'     }
#'     \item {     INVALID_ODDS
#'            Odds not on price ladder - either edit or placement
#'     }
#'     \item {     INSUFFICIENT_FUNDS
#'            Insufficient funds available to cover the bet action. Either the
#'            exposure limit or available to bet limit would be exceeded 
#'     }
#'     \item {     INVALID_PERSISTENCE_TYPE
#'            Invalid persistence type for this market, e.g. KEEP for a non bsp
#'            market
#'     }
#'     \item {     ERROR_IN_MATCHER
#'            A problem with the matcher prevented this action completing
#'            successfully
#'     }
#'     \item {     INVALID_BACK_LAY_COMBINATION
#'            The order contains a back and a lay for the same runner at overlapping
#'            prices. This would guarantee a self match. This also applies to BSP
#'            limit on close bets 
#'     }
#'     \item {     ERROR_IN_ORDER
#'            The action failed because the parent order failed
#'     }
#'     \item {     INVALID_BID_TYPE
#'            Bid type is mandatory 
#'     }
#'     \item {     INVALID_BET_ID
#'            Bet for id supplied has not been found
#'     }
#'     \item {     CANCELLED_NOT_PLACED
#'            Bet cancelled but replacement bet was not placed
#'     }
#'     \item {     RELATED_ACTION_FAILED
#'            Action failed due to the failure of a action on which this action is
#'            dependent 
#'     }
#'     \item {     NO_ACTION_REQUIRED
#'            the action does not result in any state change. eg changing a
#'            persistence to it's current value 
#'     }
#'   }
#' }
################################################################################
InstructionReportErrorCodeValidValues=c("INVALID_BET_SIZE","INVALID_RUNNER","BET_TAKEN_OR_LAPSED","BET_IN_PROGRESS","RUNNER_REMOVED","MARKET_NOT_OPEN_FOR_BETTING","LOSS_LIMIT_EXCEEDED","MARKET_NOT_OPEN_FOR_BSP_BETTING","INVALID_PRICE_EDIT","INVALID_ODDS","INSUFFICIENT_FUNDS","INVALID_PERSISTENCE_TYPE","ERROR_IN_MATCHER","INVALID_BACK_LAY_COMBINATION","ERROR_IN_ORDER","INVALID_BID_TYPE","INVALID_BET_ID","CANCELLED_NOT_PLACED","RELATED_ACTION_FAILED","NO_ACTION_REQUIRED")
InstructionReportErrorCode<-function(values) {
  validateSet(values,'InstructionReportErrorCode',InstructionReportErrorCodeValidValues)
  class(values) <- append(class(values),"InstructionReportErrorCode")
  return(values)
}
SetOfInstructionReportErrorCode<-function(...) { SetOfV(list(...),'InstructionReportErrorCode',InstructionReportErrorCodeValidValues) }
ListOfInstructionReportErrorCode<-function(...) { ListOfV(list(...),'InstructionReportErrorCode',InstructionReportErrorCodeValidValues) }

################################################################################
#' @title RollupModel
#' @description RollupModel
#' @usage RollupModel(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     STAKE
#'            The volumes will be rolled up to the minimum value which is >=
#'            rollupLimit. 
#'     }
#'     \item {     PAYOUT
#'            The volumes will be rolled up to the minimum value where the payout(
#'            price * volume ) is >= rollupLimit. 
#'     }
#'     \item {     MANAGED_LIABILITY
#'            The volumes will be rolled up to the minimum value which is >=
#'            rollupLimit, until a lay price threshold. There after, the volumes
#'            will be rolled up to the minimum value such that the liability >= a
#'            minimum liability. Not supported as yet. 
#'     }
#'     \item {     NONE
#'            No rollup will be applied. However the volumes will be filtered by
#'            currency specific minimum stake unless overridden specifically for the
#'            channel. 
#'     }
#'   }
#' }
################################################################################
RollupModelValidValues=c("STAKE","PAYOUT","MANAGED_LIABILITY","NONE")
RollupModel<-function(values) {
  validateSet(values,'RollupModel',RollupModelValidValues)
  class(values) <- append(class(values),"RollupModel")
  return(values)
}
SetOfRollupModel<-function(...) { SetOfV(list(...),'RollupModel',RollupModelValidValues) }
ListOfRollupModel<-function(...) { ListOfV(list(...),'RollupModel',RollupModelValidValues) }

################################################################################
#' @title GroupBy
#' @description GroupBy
#' @usage GroupBy(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     EVENT_TYPE
#'            A roll up of settled P&L, commission paid and number of bet orders, on
#'            a specified event type 
#'     }
#'     \item {     EVENT
#'            A roll up of settled P&L, commission paid and number of bet orders, on
#'            a specified event 
#'     }
#'     \item {     MARKET
#'            A roll up of settled P&L, commission paid and number of bet orders, on
#'            a specified market 
#'     }
#'     \item {     RUNNER
#'            A roll up of settled P&L and the number of bet orders, on a specified
#'            runner within a specified market 
#'     }
#'     \item {     SIDE
#'            An averaged roll up of settled P&L, and number of bets, on the
#'            specified side of a specified selection within a specified market,
#'            that are either settled or voided 
#'     }
#'     \item {     BET
#'            The P&L, commission paid, side and regulatory information etc, about
#'            each individual bet order 
#'     }
#'   }
#' }
################################################################################
GroupByValidValues=c("EVENT_TYPE","EVENT","MARKET","RUNNER","SIDE","BET")
GroupBy<-function(values) {
  validateSet(values,'GroupBy',GroupByValidValues)
  class(values) <- append(class(values),"GroupBy")
  return(values)
}
SetOfGroupBy<-function(...) { SetOfV(list(...),'GroupBy',GroupByValidValues) }
ListOfGroupBy<-function(...) { ListOfV(list(...),'GroupBy',GroupByValidValues) }

################################################################################
#' @title BetStatus
#' @description BetStatus
#' @usage BetStatus(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     SETTLED
#'            A matched bet that was settled normally
#'     }
#'     \item {     VOIDED
#'            A matched bet that was subsequently voided by Betfair, before, during
#'            or after settlement 
#'     }
#'     \item {     LAPSED
#'            Unmatched bet that was cancelled by Betfair (for example at turn in
#'            play).
#'     }
#'     \item {     CANCELLED
#'            Unmatched bet that was cancelled by an explicit customer action.
#'     }
#'   }
#' }
################################################################################
BetStatusValidValues=c("SETTLED","VOIDED","LAPSED","CANCELLED")
BetStatus<-function(values) {
  validateSet(values,'BetStatus',BetStatusValidValues)
  class(values) <- append(class(values),"BetStatus")
  return(values)
}
SetOfBetStatus<-function(...) { SetOfV(list(...),'BetStatus',BetStatusValidValues) }
ListOfBetStatus<-function(...) { ListOfV(list(...),'BetStatus',BetStatusValidValues) }

################################################################################
#' @title  MarketFilter
#' @param textQuery is optional of type character.
#'        Restrict markets by any text associated with the market such as the
#'        Name, Event, Competition, etc. You can include a wildcard (*)
#'        character as long as it is not the first character. 
#' @param exchangeIds is optional of type SetOfExchangeId.
#'        Restrict markets by the Exchange where the market operates. Note: This
#'        is not currently in use and only entities for the current exchange
#'        will be returned. 
#' @param eventTypeIds is optional of type SetOfEventTypeId.
#'        Restrict markets by event type associated with the market. (i.e.,
#'        Football, Hockey, etc) 
#' @param eventIds is optional of type SetOfEventId.
#'        Restrict markets by the event id associated with the market.
#' @param competitionIds is optional of type SetOfCompetitionId.
#'        Restrict markets by the competitions associated with the market.
#' @param marketIds is optional of type SetOfMarketId.
#'        Restrict markets by the market id associated with the market.
#' @param venues is optional of type SetOfVenue.
#'        Restrict markets by the venue associated with the market. Currently
#'        only Horse Racing markets have venues. 
#' @param bspOnly is optional of type logical.
#'        Restrict to bsp markets only, if True or non-bsp markets if False. If
#'        not specified then returns both BSP and non-BSP markets 
#' @param turnInPlayEnabled is optional of type logical.
#'        Restrict to markets that will turn in play if True or will not turn in
#'        play if false. If not specified, returns both. 
#' @param inPlayOnly is optional of type logical.
#'        Restrict to markets that will turn in play if True or will not turn in
#'        play if false. If not specified, returns both. 
#' @param marketBettingTypes is optional of type SetOfMarketBettingType.
#'        Restrict to markets that match the betting type of the market (i.e.
#'        Odds, Asian Handicap Singles, or Asian Handicap Doubles 
#' @param marketCountries is optional of type SetOfCountryCode.
#'        Restrict to markets that are in the specified country or countries
#' @param marketTypeCodes is optional of type SetOfMarketType.
#'        Restrict to markets that match the type of the market (i.e.,
#'        MATCH_ODDS, HALF_TIME_SCORE). You should use this instead of relying
#'        on the market name as the market type codes are the same in all
#'        locales 
#' @param marketStartTime is optional of type TimeRange.
#'        Restrict to markets with a market start time before or after the
#'        specified date
#' @param withOrders is optional of type SetOfOrderStatus.
#'        Restrict to markets that I have one or more orders in these status. 
################################################################################
MarketFilter<-function(textQuery=NULL,exchangeIds=NULL,eventTypeIds=NULL,eventIds=NULL,competitionIds=NULL,marketIds=NULL,venues=NULL,bspOnly=NULL,turnInPlayEnabled=NULL,inPlayOnly=NULL,marketBettingTypes=NULL,marketCountries=NULL,marketTypeCodes=NULL,marketStartTime=NULL,withOrders=NULL) {
  validateField(textQuery,'character',FALSE,'textQuery')
  validateField(exchangeIds,'SetOfExchangeId',FALSE,'exchangeIds')
  validateField(eventTypeIds,'SetOfEventTypeId',FALSE,'eventTypeIds')
  validateField(eventIds,'SetOfEventId',FALSE,'eventIds')
  validateField(competitionIds,'SetOfCompetitionId',FALSE,'competitionIds')
  validateField(marketIds,'SetOfMarketId',FALSE,'marketIds')
  validateField(venues,'SetOfVenue',FALSE,'venues')
  validateField(bspOnly,'logical',FALSE,'bspOnly')
  validateField(turnInPlayEnabled,'logical',FALSE,'turnInPlayEnabled')
  validateField(inPlayOnly,'logical',FALSE,'inPlayOnly')
  validateField(marketBettingTypes,'SetOfMarketBettingType',FALSE,'marketBettingTypes')
  validateField(marketCountries,'SetOfCountryCode',FALSE,'marketCountries')
  validateField(marketTypeCodes,'SetOfMarketType',FALSE,'marketTypeCodes')
  validateField(marketStartTime,'TimeRange',FALSE,'marketStartTime')
  validateField(withOrders,'SetOfOrderStatus',FALSE,'withOrders')

  ret=list(textQuery=textQuery,exchangeIds=exchangeIds,eventTypeIds=eventTypeIds,eventIds=eventIds,competitionIds=competitionIds,marketIds=marketIds,venues=venues,bspOnly=bspOnly,turnInPlayEnabled=turnInPlayEnabled,inPlayOnly=inPlayOnly,marketBettingTypes=marketBettingTypes,marketCountries=marketCountries,marketTypeCodes=marketTypeCodes,marketStartTime=marketStartTime,withOrders=withOrders)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"MarketFilter")
  ret
}

SetOfMarketFilter<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfMarketFilter')
  return(lv)
}

ListOfMarketFilter<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfMarketFilter')
  return(lv)
}

################################################################################
#' @title  MarketCatalogue
#' @description Information about a market
#' @param marketId is mandatory of type character.
#'        The unique identifier for the market
#' @param marketName is mandatory of type character.
#'        The name of the market
#' @param marketStartTime is optional of type dateTime.
#'        The time this market starts at, only returned when the
#'        MARKET_START_TIME enum is passed in the marketProjections 
#' @param description is optional of type MarketDescription.
#'        Details about the market
#' @param totalMatched is optional of type numeric.
#'        The total amount of money matched on the market. This value is
#'        truncated at 2dp.
#' @param runners is optional of type ListOfRunnerCatalog.
#'        The runners (selections) contained in the market
#' @param eventType is optional of type EventType.
#'        The Event Type the market is contained within
#' @param competition is optional of type Competition.
#'        The competition the market is contained within. Usually only applies
#'        to Football competitions 
#' @param event is optional of type Event.
#'        The event the market is contained within
################################################################################
MarketCatalogue<-function(marketId,marketName,marketStartTime=NULL,description=NULL,totalMatched=NULL,runners=NULL,eventType=NULL,competition=NULL,event=NULL) {
  validateField(marketId,'character',TRUE,'marketId')
  validateField(marketName,'character',TRUE,'marketName')
  validateDateTime(marketStartTime,'dateTime',FALSE,'marketStartTime')
  validateField(description,'MarketDescription',FALSE,'description')
  validateField(totalMatched,'numeric',FALSE,'totalMatched')
  validateField(runners,'ListOfRunnerCatalog',FALSE,'runners')
  validateField(eventType,'EventType',FALSE,'eventType')
  validateField(competition,'Competition',FALSE,'competition')
  validateField(event,'Event',FALSE,'event')

  ret=list(marketId=marketId,marketName=marketName,marketStartTime=marketStartTime,description=description,totalMatched=totalMatched,runners=runners,eventType=eventType,competition=competition,event=event)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"MarketCatalogue")
  ret
}

SetOfMarketCatalogue<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfMarketCatalogue')
  return(lv)
}

ListOfMarketCatalogue<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfMarketCatalogue')
  return(lv)
}

################################################################################
#' @title  MarketBook
#' @description The dynamic data in a market
#' @param marketId is mandatory of type character.
#'        The unique identifier for the market
#' @param isMarketDataDelayed is mandatory of type logical.
#'        True if the data returned by listMarketBook will be delayed. The data
#'        may be delayed because you are not logged in with a funded account or
#'        you are using an Application Key that does not allow up to date data. 
#' @param status is optional of type character.
#'        The status of the market, for example ACTIVE, SUSPENDED, SETTLED, etc.
#' @param betDelay is optional of type integer.
#'        The number of seconds an order is held until it is submitted into the
#'        market. Orders are usually delayed when the market is in-play 
#' @param bspReconciled is optional of type logical.
#'        True if the market starting price has been reconciled
#' @param complete is optional of type logical.
#'        
#' @param inplay is optional of type logical.
#'        True if the market is currently in play
#' @param numberOfWinners is optional of type integer.
#'        The number of selections that could be settled as winners
#' @param numberOfRunners is optional of type integer.
#'        The number of runners in the market
#' @param numberOfActiveRunners is optional of type integer.
#'        The number of runners that are currently active. An active runner is a
#'        selection available for betting 
#' @param lastMatchTime is optional of type dateTime.
#'        The most recent time an order was executed
#' @param totalMatched is optional of type numeric.
#'        The total amount matched. This value is truncated at 2dp.
#' @param totalAvailable is optional of type numeric.
#'        The total amount of orders that remain unmatched. This value is
#'        truncated at 2dp.
#' @param crossMatching is optional of type logical.
#'        True if cross matching is enabled for this market.
#' @param runnersVoidable is optional of type logical.
#'        True if runners in the market can be voided
#' @param version is optional of type integer.
#'        The version of the market. The version increments whenever the market
#'        status changes, for example, turning in-play, or suspended when a goal
#'        score. 
#' @param runners is optional of type ListOfRunner.
#'        Information about the runners (selections) in the market.
################################################################################
MarketBook<-function(marketId,isMarketDataDelayed,status=NULL,betDelay=NULL,bspReconciled=NULL,complete=NULL,inplay=NULL,numberOfWinners=NULL,numberOfRunners=NULL,numberOfActiveRunners=NULL,lastMatchTime=NULL,totalMatched=NULL,totalAvailable=NULL,crossMatching=NULL,runnersVoidable=NULL,version=NULL,runners=NULL) {
  validateField(marketId,'character',TRUE,'marketId')
  validateField(isMarketDataDelayed,'logical',TRUE,'isMarketDataDelayed')
  validateField(status,'character',FALSE,'status')
  validateField(betDelay,'integer',FALSE,'betDelay')
  validateField(bspReconciled,'logical',FALSE,'bspReconciled')
  validateField(complete,'logical',FALSE,'complete')
  validateField(inplay,'logical',FALSE,'inplay')
  validateField(numberOfWinners,'integer',FALSE,'numberOfWinners')
  validateField(numberOfRunners,'integer',FALSE,'numberOfRunners')
  validateField(numberOfActiveRunners,'integer',FALSE,'numberOfActiveRunners')
  validateDateTime(lastMatchTime,'dateTime',FALSE,'lastMatchTime')
  validateField(totalMatched,'numeric',FALSE,'totalMatched')
  validateField(totalAvailable,'numeric',FALSE,'totalAvailable')
  validateField(crossMatching,'logical',FALSE,'crossMatching')
  validateField(runnersVoidable,'logical',FALSE,'runnersVoidable')
  validateField(version,'integer',FALSE,'version')
  validateField(runners,'ListOfRunner',FALSE,'runners')

  ret=list(marketId=marketId,isMarketDataDelayed=isMarketDataDelayed,status=status,betDelay=betDelay,bspReconciled=bspReconciled,complete=complete,inplay=inplay,numberOfWinners=numberOfWinners,numberOfRunners=numberOfRunners,numberOfActiveRunners=numberOfActiveRunners,lastMatchTime=lastMatchTime,totalMatched=totalMatched,totalAvailable=totalAvailable,crossMatching=crossMatching,runnersVoidable=runnersVoidable,version=version,runners=runners)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"MarketBook")
  ret
}

SetOfMarketBook<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfMarketBook')
  return(lv)
}

ListOfMarketBook<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfMarketBook')
  return(lv)
}

################################################################################
#' @title  RunnerCatalog
#' @description Information about the Runners (selections) in a market
#' @param selectionId is mandatory of type integer.
#'        The unique id for the selection.
#' @param runnerName is mandatory of type character.
#'        The name of the runner
#' @param handicap is mandatory of type numeric.
#'        The handicap
#' @param sortPriority is mandatory of type integer.
#'        The sort priority of this runner
#' @param metadata is optional of type map(string,string).
#'        Metadata associated with the runner
################################################################################
RunnerCatalog<-function(selectionId,runnerName,handicap,sortPriority,metadata=NULL) {
  validateField(selectionId,'integer',TRUE,'selectionId')
  validateField(runnerName,'character',TRUE,'runnerName')
  validateField(handicap,'numeric',TRUE,'handicap')
  validateField(sortPriority,'integer',TRUE,'sortPriority')
  validateField(metadata,'map(string,string)',FALSE,'metadata')

  ret=list(selectionId=selectionId,runnerName=runnerName,handicap=handicap,sortPriority=sortPriority,metadata=metadata)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"RunnerCatalog")
  ret
}

SetOfRunnerCatalog<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfRunnerCatalog')
  return(lv)
}

ListOfRunnerCatalog<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfRunnerCatalog')
  return(lv)
}

################################################################################
#' @title  Runner
#' @description The dynamic data about runners in a market
#' @param selectionId is mandatory of type integer.
#'        The unique id of the runner (selection)
#' @param handicap is mandatory of type numeric.
#'        The handicap
#' @param status is mandatory of type character.
#'        The status of the selection (i.e., ACTIVE, REMOVED, WINNER, LOSER)
#' @param adjustmentFactor is mandatory of type numeric.
#'        The adjustment factor applied if the selection is removed
#' @param lastPriceTraded is optional of type numeric.
#'        The price of the most recent bet matched on this selection
#' @param totalMatched is optional of type numeric.
#'        The total amount matched on this runner. This value is truncated at
#'        2dp.
#' @param removalDate is optional of type dateTime.
#'        If date and time the runner was removed
#' @param sp is optional of type StartingPrices.
#'        The BSP related prices for this runner
#' @param ex is optional of type ExchangePrices.
#'        The Exchange prices available for this runner
#' @param orders is optional of type ListOfOrder.
#'        List of orders in the market
#' @param matches is optional of type ListOfMatch.
#'        List of matches (i.e, orders that have been fully or partially
#'        executed)
################################################################################
Runner<-function(selectionId,handicap,status,adjustmentFactor,lastPriceTraded=NULL,totalMatched=NULL,removalDate=NULL,sp=NULL,ex=NULL,orders=NULL,matches=NULL) {
  validateField(selectionId,'integer',TRUE,'selectionId')
  validateField(handicap,'numeric',TRUE,'handicap')
  validateField(status,'character',TRUE,'status')
  validateField(adjustmentFactor,'numeric',TRUE,'adjustmentFactor')
  validateField(lastPriceTraded,'numeric',FALSE,'lastPriceTraded')
  validateField(totalMatched,'numeric',FALSE,'totalMatched')
  validateDateTime(removalDate,'dateTime',FALSE,'removalDate')
  validateField(sp,'StartingPrices',FALSE,'sp')
  validateField(ex,'ExchangePrices',FALSE,'ex')
  validateField(orders,'ListOfOrder',FALSE,'orders')
  validateField(matches,'ListOfMatch',FALSE,'matches')

  ret=list(selectionId=selectionId,handicap=handicap,status=status,adjustmentFactor=adjustmentFactor,lastPriceTraded=lastPriceTraded,totalMatched=totalMatched,removalDate=removalDate,sp=sp,ex=ex,orders=orders,matches=matches)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"Runner")
  ret
}

SetOfRunner<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfRunner')
  return(lv)
}

ListOfRunner<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfRunner')
  return(lv)
}

################################################################################
#' @title  RunnerDescription
#' @param runnerName is mandatory of type character.
#'        The name of the runner
#' @param metadata is optional of type map(string,string).
#'        The metadata for this runner, such as horse racing silks.
################################################################################
RunnerDescription<-function(runnerName,metadata=NULL) {
  validateField(runnerName,'character',TRUE,'runnerName')
  validateField(metadata,'map(string,string)',FALSE,'metadata')

  ret=list(runnerName=runnerName,metadata=metadata)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"RunnerDescription")
  ret
}

SetOfRunnerDescription<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfRunnerDescription')
  return(lv)
}

ListOfRunnerDescription<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfRunnerDescription')
  return(lv)
}

################################################################################
#' @title  StartingPrices
#' @description Information about the Betfair Starting Price. Only available in BSP markets
#' @param nearPrice is optional of type numeric.
#'        What the starting price would be if the market was reconciled now
#'        taking into account the SP bets as well as unmatched exchange bets on
#'        the same selection in the exchange. 
#' @param farPrice is optional of type numeric.
#'        What the starting price would be if the market was reconciled now
#'        taking into account only the currently place SP bets. The Far Price is
#'        not as complicated but not as accurate and only accounts for money on
#'        the exchange at SP. 
#' @param backStakeTaken is optional of type ListOfPriceSize.
#'        
#' @param layLiabilityTaken is optional of type ListOfPriceSize.
#'        
#' @param actualSP is optional of type numeric.
#'        The final BSP price for this runner. Only available for a BSP market
#'        that has been reconciled. 
################################################################################
StartingPrices<-function(nearPrice=NULL,farPrice=NULL,backStakeTaken=NULL,layLiabilityTaken=NULL,actualSP=NULL) {
  validateField(nearPrice,'numeric',FALSE,'nearPrice')
  validateField(farPrice,'numeric',FALSE,'farPrice')
  validateField(backStakeTaken,'ListOfPriceSize',FALSE,'backStakeTaken')
  validateField(layLiabilityTaken,'ListOfPriceSize',FALSE,'layLiabilityTaken')
  validateField(actualSP,'numeric',FALSE,'actualSP')

  ret=list(nearPrice=nearPrice,farPrice=farPrice,backStakeTaken=backStakeTaken,layLiabilityTaken=layLiabilityTaken,actualSP=actualSP)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"StartingPrices")
  ret
}

SetOfStartingPrices<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfStartingPrices')
  return(lv)
}

ListOfStartingPrices<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfStartingPrices')
  return(lv)
}

################################################################################
#' @title  ExchangePrices
#' @param availableToBack is optional of type ListOfPriceSize.
#'        
#' @param availableToLay is optional of type ListOfPriceSize.
#'        
#' @param tradedVolume is optional of type ListOfPriceSize.
#'        
################################################################################
ExchangePrices<-function(availableToBack=NULL,availableToLay=NULL,tradedVolume=NULL) {
  validateField(availableToBack,'ListOfPriceSize',FALSE,'availableToBack')
  validateField(availableToLay,'ListOfPriceSize',FALSE,'availableToLay')
  validateField(tradedVolume,'ListOfPriceSize',FALSE,'tradedVolume')

  ret=list(availableToBack=availableToBack,availableToLay=availableToLay,tradedVolume=tradedVolume)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"ExchangePrices")
  ret
}

SetOfExchangePrices<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfExchangePrices')
  return(lv)
}

ListOfExchangePrices<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfExchangePrices')
  return(lv)
}

################################################################################
#' @title  Event
#' @description Event
#' @param id is optional of type character.
#'        The unique id for the event
#' @param name is optional of type character.
#'        The name of the event
#' @param countryCode is optional of type character.
#'        countryCode
#' @param timezone is optional of type character.
#'        timezone
#' @param venue is optional of type character.
#'        venue
#' @param openDate is optional of type dateTime.
#'        openDate
################################################################################
Event<-function(id=NULL,name=NULL,countryCode=NULL,timezone=NULL,venue=NULL,openDate=NULL) {
  validateField(id,'character',FALSE,'id')
  validateField(name,'character',FALSE,'name')
  validateField(countryCode,'character',FALSE,'countryCode')
  validateField(timezone,'character',FALSE,'timezone')
  validateField(venue,'character',FALSE,'venue')
  validateDateTime(openDate,'dateTime',FALSE,'openDate')

  ret=list(id=id,name=name,countryCode=countryCode,timezone=timezone,venue=venue,openDate=openDate)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"Event")
  ret
}

SetOfEvent<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfEvent')
  return(lv)
}

ListOfEvent<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfEvent')
  return(lv)
}

################################################################################
#' @title  EventResult
#' @description Event Result
#' @param event is optional of type Event.
#'        Event
#' @param marketCount is optional of type integer.
#'        Count of markets associated with this event
################################################################################
EventResult<-function(event=NULL,marketCount=NULL) {
  validateField(event,'Event',FALSE,'event')
  validateField(marketCount,'integer',FALSE,'marketCount')

  ret=list(event=event,marketCount=marketCount)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"EventResult")
  ret
}

SetOfEventResult<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfEventResult')
  return(lv)
}

ListOfEventResult<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfEventResult')
  return(lv)
}

################################################################################
#' @title  Competition
#' @description Competition
#' @param id is optional of type character.
#'        id
#' @param name is optional of type character.
#'        name
################################################################################
Competition<-function(id=NULL,name=NULL) {
  validateField(id,'character',FALSE,'id')
  validateField(name,'character',FALSE,'name')

  ret=list(id=id,name=name)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"Competition")
  ret
}

SetOfCompetition<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfCompetition')
  return(lv)
}

ListOfCompetition<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfCompetition')
  return(lv)
}

################################################################################
#' @title  CompetitionResult
#' @description Competition Result
#' @param competition is optional of type Competition.
#'        Competition
#' @param marketCount is optional of type integer.
#'        Count of markets associated with this competition
#' @param competitionRegion is optional of type character.
#'        Region in which this competition is happening
################################################################################
CompetitionResult<-function(competition=NULL,marketCount=NULL,competitionRegion=NULL) {
  validateField(competition,'Competition',FALSE,'competition')
  validateField(marketCount,'integer',FALSE,'marketCount')
  validateField(competitionRegion,'character',FALSE,'competitionRegion')

  ret=list(competition=competition,marketCount=marketCount,competitionRegion=competitionRegion)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"CompetitionResult")
  ret
}

SetOfCompetitionResult<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfCompetitionResult')
  return(lv)
}

ListOfCompetitionResult<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfCompetitionResult')
  return(lv)
}

################################################################################
#' @title  EventType
#' @description EventType
#' @param id is optional of type character.
#'        id
#' @param name is optional of type character.
#'        name
################################################################################
EventType<-function(id=NULL,name=NULL) {
  validateField(id,'character',FALSE,'id')
  validateField(name,'character',FALSE,'name')

  ret=list(id=id,name=name)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"EventType")
  ret
}

SetOfEventType<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfEventType')
  return(lv)
}

ListOfEventType<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfEventType')
  return(lv)
}

################################################################################
#' @title  EventTypeResult
#' @description EventType Result
#' @param eventType is optional of type EventType.
#'        EventType
#' @param marketCount is optional of type integer.
#'        Count of markets associated with this eventType
################################################################################
EventTypeResult<-function(eventType=NULL,marketCount=NULL) {
  validateField(eventType,'EventType',FALSE,'eventType')
  validateField(marketCount,'integer',FALSE,'marketCount')

  ret=list(eventType=eventType,marketCount=marketCount)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"EventTypeResult")
  ret
}

SetOfEventTypeResult<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfEventTypeResult')
  return(lv)
}

ListOfEventTypeResult<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfEventTypeResult')
  return(lv)
}

################################################################################
#' @title  MarketTypeResult
#' @description MarketType Result
#' @param marketType is optional of type character.
#'        Market Type
#' @param marketCount is optional of type integer.
#'        Count of markets associated with this marketType
################################################################################
MarketTypeResult<-function(marketType=NULL,marketCount=NULL) {
  validateField(marketType,'character',FALSE,'marketType')
  validateField(marketCount,'integer',FALSE,'marketCount')

  ret=list(marketType=marketType,marketCount=marketCount)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"MarketTypeResult")
  ret
}

SetOfMarketTypeResult<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfMarketTypeResult')
  return(lv)
}

ListOfMarketTypeResult<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfMarketTypeResult')
  return(lv)
}

################################################################################
#' @title  CountryCodeResult
#' @description CountryCode Result
#' @param countryCode is optional of type character.
#'        Country Code
#' @param marketCount is optional of type integer.
#'        Count of markets associated with this Country Code
################################################################################
CountryCodeResult<-function(countryCode=NULL,marketCount=NULL) {
  validateField(countryCode,'character',FALSE,'countryCode')
  validateField(marketCount,'integer',FALSE,'marketCount')

  ret=list(countryCode=countryCode,marketCount=marketCount)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"CountryCodeResult")
  ret
}

SetOfCountryCodeResult<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfCountryCodeResult')
  return(lv)
}

ListOfCountryCodeResult<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfCountryCodeResult')
  return(lv)
}

################################################################################
#' @title  VenueResult
#' @description Venue Result
#' @param venue is optional of type character.
#'        Venue
#' @param marketCount is optional of type integer.
#'        Count of markets associated with this Venue
################################################################################
VenueResult<-function(venue=NULL,marketCount=NULL) {
  validateField(venue,'character',FALSE,'venue')
  validateField(marketCount,'integer',FALSE,'marketCount')

  ret=list(venue=venue,marketCount=marketCount)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"VenueResult")
  ret
}

SetOfVenueResult<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfVenueResult')
  return(lv)
}

ListOfVenueResult<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfVenueResult')
  return(lv)
}

################################################################################
#' @title  TimeRange
#' @description TimeRange
#' @param from is optional of type dateTime.
#'        from, format: ISO 8601)
#' @param to is optional of type dateTime.
#'        to, format: ISO 8601
################################################################################
TimeRange<-function(from=NULL,to=NULL) {
  validateDateTime(from,'dateTime',FALSE,'from')
  validateDateTime(to,'dateTime',FALSE,'to')

  ret=list(from=from,to=to)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"TimeRange")
  ret
}

SetOfTimeRange<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfTimeRange')
  return(lv)
}

ListOfTimeRange<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfTimeRange')
  return(lv)
}

################################################################################
#' @title  TimeRangeResult
#' @description TimeRange Result
#' @param timeRange is optional of type TimeRange.
#'        TimeRange
#' @param marketCount is optional of type integer.
#'        Count of markets associated with this TimeRange
################################################################################
TimeRangeResult<-function(timeRange=NULL,marketCount=NULL) {
  validateField(timeRange,'TimeRange',FALSE,'timeRange')
  validateField(marketCount,'integer',FALSE,'marketCount')

  ret=list(timeRange=timeRange,marketCount=marketCount)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"TimeRangeResult")
  ret
}

SetOfTimeRangeResult<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfTimeRangeResult')
  return(lv)
}

ListOfTimeRangeResult<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfTimeRangeResult')
  return(lv)
}

################################################################################
#' @title  Order
#' @param betId is mandatory of type character.
#'        
#' @param orderType is mandatory of type character.
#'        BSP Order type.
#' @param status is mandatory of type character.
#'        Either EXECUTABLE (an unmatched amount remains) or EXECUTION_COMPLETE
#'        (no unmatched amount remains). 
#' @param persistenceType is mandatory of type character.
#'        What to do with the order at turn-in-play
#' @param side is mandatory of type character.
#'        
#' @param price is mandatory of type numeric.
#'        The price of the bet.
#' @param size is mandatory of type numeric.
#'        The size of the bet.
#' @param bspLiability is mandatory of type numeric.
#'        Not to be confused with size. This is the liability of a given BSP
#'        bet.
#' @param placedDate is mandatory of type dateTime.
#'        The date, to the second, the bet was placed.
#' @param avgPriceMatched is optional of type numeric.
#'        The average price matched at. Voided match fragments are removed from
#'        this average calculation. 
#' @param sizeMatched is optional of type numeric.
#'        The current amount of this bet that was matched.
#' @param sizeRemaining is optional of type numeric.
#'        The current amount of this bet that is unmatched.
#' @param sizeLapsed is optional of type numeric.
#'        The current amount of this bet that was lapsed.
#' @param sizeCancelled is optional of type numeric.
#'        The current amount of this bet that was cancelled.
#' @param sizeVoided is optional of type numeric.
#'        The current amount of this bet that was voided.
################################################################################
Order<-function(betId,orderType,status,persistenceType,side,price,size,bspLiability,placedDate,avgPriceMatched=NULL,sizeMatched=NULL,sizeRemaining=NULL,sizeLapsed=NULL,sizeCancelled=NULL,sizeVoided=NULL) {
  validateField(betId,'character',TRUE,'betId')
  validateField(orderType,'character',TRUE,'orderType')
  validateField(status,'character',TRUE,'status')
  validateField(persistenceType,'character',TRUE,'persistenceType')
  validateField(side,'character',TRUE,'side')
  validateField(price,'numeric',TRUE,'price')
  validateField(size,'numeric',TRUE,'size')
  validateField(bspLiability,'numeric',TRUE,'bspLiability')
  validateDateTime(placedDate,'dateTime',TRUE,'placedDate')
  validateField(avgPriceMatched,'numeric',FALSE,'avgPriceMatched')
  validateField(sizeMatched,'numeric',FALSE,'sizeMatched')
  validateField(sizeRemaining,'numeric',FALSE,'sizeRemaining')
  validateField(sizeLapsed,'numeric',FALSE,'sizeLapsed')
  validateField(sizeCancelled,'numeric',FALSE,'sizeCancelled')
  validateField(sizeVoided,'numeric',FALSE,'sizeVoided')

  ret=list(betId=betId,orderType=orderType,status=status,persistenceType=persistenceType,side=side,price=price,size=size,bspLiability=bspLiability,placedDate=placedDate,avgPriceMatched=avgPriceMatched,sizeMatched=sizeMatched,sizeRemaining=sizeRemaining,sizeLapsed=sizeLapsed,sizeCancelled=sizeCancelled,sizeVoided=sizeVoided)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"Order")
  ret
}

SetOfOrder<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfOrder')
  return(lv)
}

ListOfOrder<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfOrder')
  return(lv)
}

################################################################################
#' @title  Match
#' @description An individual bet Match, or rollup by price or avg price. Rollup depends on
#' the requested MatchProjection 
#' @param betId is optional of type character.
#'        Only present if no rollup
#' @param matchId is optional of type character.
#'        Only present if no rollup
#' @param side is mandatory of type character.
#'        
#' @param price is mandatory of type numeric.
#'        Either actual match price or avg match price depending on rollup. 
#' @param Size is mandatory of type numeric.
#'        Size matched at in this fragment, or at this price or avg price
#'        depending on rollup 
#' @param matchDate is optional of type dateTime.
#'        Only present if no rollup
################################################################################
Match<-function(betId=NULL,matchId=NULL,side,price,Size,matchDate=NULL) {
  validateField(betId,'character',FALSE,'betId')
  validateField(matchId,'character',FALSE,'matchId')
  validateField(side,'character',TRUE,'side')
  validateField(price,'numeric',TRUE,'price')
  validateField(Size,'numeric',TRUE,'Size')
  validateDateTime(matchDate,'dateTime',FALSE,'matchDate')

  ret=list(betId=betId,matchId=matchId,side=side,price=price,Size=Size,matchDate=matchDate)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"Match")
  ret
}

SetOfMatch<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfMatch')
  return(lv)
}

ListOfMatch<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfMatch')
  return(lv)
}

################################################################################
#' @title  MarketState
#' @description Market definition
#' @param status is mandatory of type character.
#'        marketStatus
#' @param betDelay is mandatory of type integer.
#'        betDelay
#' @param bspReconciled is mandatory of type logical.
#'        bspReconciled
#' @param complete is mandatory of type logical.
#'        complete
#' @param inplay is mandatory of type logical.
#'        inplay
#' @param numberOfActiveRunners is mandatory of type integer.
#'        numberActiveOfRunners
#' @param lastMatchTime is mandatory of type dateTime.
#'        lastMatchTime
#' @param totalMatched is mandatory of type numeric.
#'        
#' @param totalAvailable is mandatory of type numeric.
#'        Zero for closed markets
################################################################################
MarketState<-function(status,betDelay,bspReconciled,complete,inplay,numberOfActiveRunners,lastMatchTime,totalMatched,totalAvailable) {
  validateField(status,'character',TRUE,'status')
  validateField(betDelay,'integer',TRUE,'betDelay')
  validateField(bspReconciled,'logical',TRUE,'bspReconciled')
  validateField(complete,'logical',TRUE,'complete')
  validateField(inplay,'logical',TRUE,'inplay')
  validateField(numberOfActiveRunners,'integer',TRUE,'numberOfActiveRunners')
  validateDateTime(lastMatchTime,'dateTime',TRUE,'lastMatchTime')
  validateField(totalMatched,'numeric',TRUE,'totalMatched')
  validateField(totalAvailable,'numeric',TRUE,'totalAvailable')

  ret=list(status=status,betDelay=betDelay,bspReconciled=bspReconciled,complete=complete,inplay=inplay,numberOfActiveRunners=numberOfActiveRunners,lastMatchTime=lastMatchTime,totalMatched=totalMatched,totalAvailable=totalAvailable)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"MarketState")
  ret
}

SetOfMarketState<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfMarketState')
  return(lv)
}

ListOfMarketState<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfMarketState')
  return(lv)
}

################################################################################
#' @title  MarketVersion
#' @description Market version
#' @param version is optional of type integer.
#'        A non-monotonically increasing number indicating market changes
################################################################################
MarketVersion<-function(version=NULL) {
  validateField(version,'integer',FALSE,'version')

  ret=list(version=version)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"MarketVersion")
  ret
}

SetOfMarketVersion<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfMarketVersion')
  return(lv)
}

ListOfMarketVersion<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfMarketVersion')
  return(lv)
}

################################################################################
#' @title  MarketDescription
#' @description Market definition
#' @param persistenceEnabled is mandatory of type logical.
#'        persistenceMarket
#' @param bspMarket is mandatory of type logical.
#'        bspMarket
#' @param marketTime is mandatory of type dateTime.
#'        marketTime
#' @param suspendTime is mandatory of type dateTime.
#'        marketSuspendTime
#' @param settleTime is optional of type dateTime.
#'        settled time
#' @param bettingType is mandatory of type character.
#'        bettingType
#' @param turnInPlayEnabled is mandatory of type logical.
#'        canTurnInPlay
#' @param marketType is mandatory of type character.
#'        market base type
#' @param regulator is mandatory of type character.
#'        the market regulator
#' @param marketBaseRate is mandatory of type numeric.
#'        
#' @param discountAllowed is mandatory of type logical.
#'        
#' @param wallet is optional of type character.
#'        
#' @param rules is optional of type character.
#'        
#' @param rulesHasDate is optional of type logical.
#'        
#' @param clarifications is optional of type character.
#'        
################################################################################
MarketDescription<-function(persistenceEnabled,bspMarket,marketTime,suspendTime,settleTime=NULL,bettingType,turnInPlayEnabled,marketType,regulator,marketBaseRate,discountAllowed,wallet=NULL,rules=NULL,rulesHasDate=NULL,clarifications=NULL) {
  validateField(persistenceEnabled,'logical',TRUE,'persistenceEnabled')
  validateField(bspMarket,'logical',TRUE,'bspMarket')
  validateDateTime(marketTime,'dateTime',TRUE,'marketTime')
  validateDateTime(suspendTime,'dateTime',TRUE,'suspendTime')
  validateDateTime(settleTime,'dateTime',FALSE,'settleTime')
  validateField(bettingType,'character',TRUE,'bettingType')
  validateField(turnInPlayEnabled,'logical',TRUE,'turnInPlayEnabled')
  validateField(marketType,'character',TRUE,'marketType')
  validateField(regulator,'character',TRUE,'regulator')
  validateField(marketBaseRate,'numeric',TRUE,'marketBaseRate')
  validateField(discountAllowed,'logical',TRUE,'discountAllowed')
  validateField(wallet,'character',FALSE,'wallet')
  validateField(rules,'character',FALSE,'rules')
  validateField(rulesHasDate,'logical',FALSE,'rulesHasDate')
  validateField(clarifications,'character',FALSE,'clarifications')

  ret=list(persistenceEnabled=persistenceEnabled,bspMarket=bspMarket,marketTime=marketTime,suspendTime=suspendTime,settleTime=settleTime,bettingType=bettingType,turnInPlayEnabled=turnInPlayEnabled,marketType=marketType,regulator=regulator,marketBaseRate=marketBaseRate,discountAllowed=discountAllowed,wallet=wallet,rules=rules,rulesHasDate=rulesHasDate,clarifications=clarifications)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"MarketDescription")
  ret
}

SetOfMarketDescription<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfMarketDescription')
  return(lv)
}

ListOfMarketDescription<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfMarketDescription')
  return(lv)
}

################################################################################
#' @title  MarketRates
#' @description Market Rates
#' @param marketBaseRate is mandatory of type numeric.
#'        marketBaseRate
#' @param discountAllowed is mandatory of type logical.
#'        discountAllowed
################################################################################
MarketRates<-function(marketBaseRate,discountAllowed) {
  validateField(marketBaseRate,'numeric',TRUE,'marketBaseRate')
  validateField(discountAllowed,'logical',TRUE,'discountAllowed')

  ret=list(marketBaseRate=marketBaseRate,discountAllowed=discountAllowed)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"MarketRates")
  ret
}

SetOfMarketRates<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfMarketRates')
  return(lv)
}

ListOfMarketRates<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfMarketRates')
  return(lv)
}

################################################################################
#' @title  MarketLicence
#' @description Market Licence
#' @param wallet is mandatory of type character.
#'        The wallet from which funds will be taken when betting on this market
#' @param rules is optional of type character.
#'        The rules for this market
#' @param rulesHasDate is optional of type logical.
#'        The market's start date and time are relevant to the rules.
#' @param clarifications is optional of type character.
#'        Clarifications to the rules for the market
################################################################################
MarketLicence<-function(wallet,rules=NULL,rulesHasDate=NULL,clarifications=NULL) {
  validateField(wallet,'character',TRUE,'wallet')
  validateField(rules,'character',FALSE,'rules')
  validateField(rulesHasDate,'logical',FALSE,'rulesHasDate')
  validateField(clarifications,'character',FALSE,'clarifications')

  ret=list(wallet=wallet,rules=rules,rulesHasDate=rulesHasDate,clarifications=clarifications)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"MarketLicence")
  ret
}

SetOfMarketLicence<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfMarketLicence')
  return(lv)
}

ListOfMarketLicence<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfMarketLicence')
  return(lv)
}

################################################################################
#' @title  MarketLineRangeInfo
#' @description Market Line and Range Info
#' @param maxUnitValue is mandatory of type numeric.
#'        maxPrice
#' @param minUnitValue is mandatory of type numeric.
#'        minPrice
#' @param interval is mandatory of type numeric.
#'        interval
#' @param marketUnit is mandatory of type character.
#'        unit
################################################################################
MarketLineRangeInfo<-function(maxUnitValue,minUnitValue,interval,marketUnit) {
  validateField(maxUnitValue,'numeric',TRUE,'maxUnitValue')
  validateField(minUnitValue,'numeric',TRUE,'minUnitValue')
  validateField(interval,'numeric',TRUE,'interval')
  validateField(marketUnit,'character',TRUE,'marketUnit')

  ret=list(maxUnitValue=maxUnitValue,minUnitValue=minUnitValue,interval=interval,marketUnit=marketUnit)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"MarketLineRangeInfo")
  ret
}

SetOfMarketLineRangeInfo<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfMarketLineRangeInfo')
  return(lv)
}

ListOfMarketLineRangeInfo<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfMarketLineRangeInfo')
  return(lv)
}

################################################################################
#' @title  PriceSize
#' @param price is mandatory of type numeric.
#'        
#' @param size is mandatory of type numeric.
#'        
################################################################################
PriceSize<-function(price,size) {
  validateField(price,'numeric',TRUE,'price')
  validateField(size,'numeric',TRUE,'size')

  ret=list(price=price,size=size)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"PriceSize")
  ret
}

SetOfPriceSize<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfPriceSize')
  return(lv)
}

ListOfPriceSize<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfPriceSize')
  return(lv)
}

################################################################################
#' @title  CurrentOrderSummaryReport
#' @description A container representing search results.
#' @param currentOrders is mandatory of type ListOfCurrentOrderSummary.
#'        The list of current orders returned by your query. This will be a
#'        valid list (i.e. empty or non-empty but never 'null'). 
#' @param moreAvailable is mandatory of type logical.
#'        Indicates whether there are further result items beyond this page.
#'        Note that underlying data is highly time-dependent and the subsequent
#'        search orders query might return an empty result. 
################################################################################
CurrentOrderSummaryReport<-function(currentOrders,moreAvailable) {
  validateField(currentOrders,'ListOfCurrentOrderSummary',TRUE,'currentOrders')
  validateField(moreAvailable,'logical',TRUE,'moreAvailable')

  ret=list(currentOrders=currentOrders,moreAvailable=moreAvailable)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"CurrentOrderSummaryReport")
  ret
}

SetOfCurrentOrderSummaryReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfCurrentOrderSummaryReport')
  return(lv)
}

ListOfCurrentOrderSummaryReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfCurrentOrderSummaryReport')
  return(lv)
}

################################################################################
#' @title  CurrentOrderSummary
#' @description Summary of a current order.
#' @param betId is mandatory of type character.
#'        The bet ID of the original place order.
#' @param marketId is mandatory of type character.
#'        The market id the order is for.
#' @param selectionId is mandatory of type integer.
#'        The selection id the order is for.
#' @param handicap is mandatory of type numeric.
#'        The handicap of the bet.
#' @param priceSize is mandatory of type PriceSize.
#'        The price and size of the bet.
#' @param bspLiability is mandatory of type numeric.
#'        Not to be confused with size. This is the liability of a given BSP
#'        bet.
#' @param side is mandatory of type character.
#'        BACK/LAY
#' @param status is mandatory of type character.
#'        Either EXECUTABLE (an unmatched amount remains) or EXECUTION_COMPLETE
#'        (no unmatched amount remains). 
#' @param persistenceType is mandatory of type character.
#'        What to do with the order at turn-in-play.
#' @param orderType is mandatory of type character.
#'        BSP Order type.
#' @param placedDate is mandatory of type dateTime.
#'        The date, to the second, the bet was placed.
#' @param matchedDate is mandatory of type dateTime.
#'        The date, to the second, of the last matched bet fragment (where
#'        applicable).
#' @param averagePriceMatched is optional of type numeric.
#'        The average price matched at. Voided match fragments are removed from
#'        this average calculation. 
#' @param sizeMatched is optional of type numeric.
#'        The current amount of this bet that was matched.
#' @param sizeRemaining is optional of type numeric.
#'        The current amount of this bet that is unmatched.
#' @param sizeLapsed is optional of type numeric.
#'        The current amount of this bet that was lapsed.
#' @param sizeCancelled is optional of type numeric.
#'        The current amount of this bet that was cancelled.
#' @param sizeVoided is optional of type numeric.
#'        The current amount of this bet that was voided.
#' @param regulatorAuthCode is optional of type character.
#'        The regulator authorisation code.
#' @param regulatorCode is optional of type character.
#'        The regulator Code.
################################################################################
CurrentOrderSummary<-function(betId,marketId,selectionId,handicap,priceSize,bspLiability,side,status,persistenceType,orderType,placedDate,matchedDate,averagePriceMatched=NULL,sizeMatched=NULL,sizeRemaining=NULL,sizeLapsed=NULL,sizeCancelled=NULL,sizeVoided=NULL,regulatorAuthCode=NULL,regulatorCode=NULL) {
  validateField(betId,'character',TRUE,'betId')
  validateField(marketId,'character',TRUE,'marketId')
  validateField(selectionId,'integer',TRUE,'selectionId')
  validateField(handicap,'numeric',TRUE,'handicap')
  validateField(priceSize,'PriceSize',TRUE,'priceSize')
  validateField(bspLiability,'numeric',TRUE,'bspLiability')
  validateField(side,'character',TRUE,'side')
  validateField(status,'character',TRUE,'status')
  validateField(persistenceType,'character',TRUE,'persistenceType')
  validateField(orderType,'character',TRUE,'orderType')
  validateDateTime(placedDate,'dateTime',TRUE,'placedDate')
  validateDateTime(matchedDate,'dateTime',TRUE,'matchedDate')
  validateField(averagePriceMatched,'numeric',FALSE,'averagePriceMatched')
  validateField(sizeMatched,'numeric',FALSE,'sizeMatched')
  validateField(sizeRemaining,'numeric',FALSE,'sizeRemaining')
  validateField(sizeLapsed,'numeric',FALSE,'sizeLapsed')
  validateField(sizeCancelled,'numeric',FALSE,'sizeCancelled')
  validateField(sizeVoided,'numeric',FALSE,'sizeVoided')
  validateField(regulatorAuthCode,'character',FALSE,'regulatorAuthCode')
  validateField(regulatorCode,'character',FALSE,'regulatorCode')

  ret=list(betId=betId,marketId=marketId,selectionId=selectionId,handicap=handicap,priceSize=priceSize,bspLiability=bspLiability,side=side,status=status,persistenceType=persistenceType,orderType=orderType,placedDate=placedDate,matchedDate=matchedDate,averagePriceMatched=averagePriceMatched,sizeMatched=sizeMatched,sizeRemaining=sizeRemaining,sizeLapsed=sizeLapsed,sizeCancelled=sizeCancelled,sizeVoided=sizeVoided,regulatorAuthCode=regulatorAuthCode,regulatorCode=regulatorCode)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"CurrentOrderSummary")
  ret
}

SetOfCurrentOrderSummary<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfCurrentOrderSummary')
  return(lv)
}

ListOfCurrentOrderSummary<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfCurrentOrderSummary')
  return(lv)
}

################################################################################
#' @title  ClearedOrderSummary
#' @description Summary of a cleared order.
#' @param eventTypeId is optional of type character.
#'        The id of the event type bet on. Available at EVENT_TYPE groupBy level
#'        or lower.
#' @param eventId is optional of type character.
#'        The id of the event bet on. Available at EVENT groupBy level or lower.
#' @param marketId is optional of type character.
#'        The id of the market bet on. Available at MARKET groupBy level or
#'        lower.
#' @param selectionId is optional of type integer.
#'        The id of the selection bet on. Available at RUNNER groupBy level or
#'        lower.
#' @param handicap is optional of type numeric.
#'        The id of the market bet on. Available at MARKET groupBy level or
#'        lower.
#' @param betId is optional of type character.
#'        The id of the bet. Available at BET groupBy level.
#' @param placedDate is optional of type dateTime.
#'        The date the bet order was placed by the customer. Only available at
#'        BET groupBy level. 
#' @param persistenceType is optional of type character.
#'        The turn in play persistence state of the order at bet placement time.
#'        This field will be empty or omitted on true SP bets. Only available at
#'        BET groupBy level. 
#' @param orderType is optional of type character.
#'        The type of bet (e.g standard limited-liability Exchange bet (LIMIT),
#'        a standard BSP bet (MARKET_ON_CLOSE), or a minimum-accepted-price BSP
#'        bet (LIMIT_ON_CLOSE)). If the bet has a OrderType of MARKET_ON_CLOSE
#'        and a persistenceType of MARKET_ON_CLOSE then it is a bet which has
#'        transitioned from LIMIT to MARKET_ON_CLOSE. Only available at BET
#'        groupBy level. 
#' @param side is optional of type character.
#'        Whether the bet was a back or lay bet. Available at SIDE groupBy level
#'        or lower.
#' @param itemDescription is optional of type ItemDescription.
#'        A container for all the anciliary data and localised text valid for
#'        this Item
#' @param priceRequested is optional of type numeric.
#'        The average requested price across all settled bet orders under this
#'        Item. Available at SIDE groupBy level or lower. 
#' @param settledDate is optional of type dateTime.
#'        The date and time the bet order was settled by Betfair. Available at
#'        SIDE groupBy level or lower. 
#' @param betCount is optional of type integer.
#'        The number of actual bets within this grouping (will be 1 for BET
#'        groupBy)
#' @param commission is optional of type numeric.
#'        The cumulative amount of commission paid by the customer across all
#'        bets under this Item, in the account currency. Available at EXCHANGE,
#'        EVENT_TYPE, EVENT and MARKET level groupings only. 
#' @param priceMatched is optional of type numeric.
#'        The average matched price across all settled bets or bet fragments
#'        under this Item. Available at SIDE groupBy level or lower. 
#' @param priceReduced is optional of type logical.
#'        If true, then the matched price was affected by a reduction factor due
#'        to of a runner removal from this Horse Racing market. 
#' @param sizeSettled is optional of type numeric.
#'        The cumulative bet size that was settled as matched or voided under
#'        this Item, in the account currency. Available at SIDE groupBy level or
#'        lower. 
#' @param profit is optional of type numeric.
#'        The profit or loss (negative profit) gained on this line, in the
#'        account currency
#' @param sizeCancelled is optional of type numeric.
#'        The amount of the bet that was available to be matched, before
#'        cancellation or lapsing, in the account currency 
################################################################################
ClearedOrderSummary<-function(eventTypeId=NULL,eventId=NULL,marketId=NULL,selectionId=NULL,handicap=NULL,betId=NULL,placedDate=NULL,persistenceType=NULL,orderType=NULL,side=NULL,itemDescription=NULL,priceRequested=NULL,settledDate=NULL,betCount=NULL,commission=NULL,priceMatched=NULL,priceReduced=NULL,sizeSettled=NULL,profit=NULL,sizeCancelled=NULL) {
  validateField(eventTypeId,'character',FALSE,'eventTypeId')
  validateField(eventId,'character',FALSE,'eventId')
  validateField(marketId,'character',FALSE,'marketId')
  validateField(selectionId,'integer',FALSE,'selectionId')
  validateField(handicap,'numeric',FALSE,'handicap')
  validateField(betId,'character',FALSE,'betId')
  validateDateTime(placedDate,'dateTime',FALSE,'placedDate')
  validateField(persistenceType,'character',FALSE,'persistenceType')
  validateField(orderType,'character',FALSE,'orderType')
  validateField(side,'character',FALSE,'side')
  validateField(itemDescription,'ItemDescription',FALSE,'itemDescription')
  validateField(priceRequested,'numeric',FALSE,'priceRequested')
  validateDateTime(settledDate,'dateTime',FALSE,'settledDate')
  validateField(betCount,'integer',FALSE,'betCount')
  validateField(commission,'numeric',FALSE,'commission')
  validateField(priceMatched,'numeric',FALSE,'priceMatched')
  validateField(priceReduced,'logical',FALSE,'priceReduced')
  validateField(sizeSettled,'numeric',FALSE,'sizeSettled')
  validateField(profit,'numeric',FALSE,'profit')
  validateField(sizeCancelled,'numeric',FALSE,'sizeCancelled')

  ret=list(eventTypeId=eventTypeId,eventId=eventId,marketId=marketId,selectionId=selectionId,handicap=handicap,betId=betId,placedDate=placedDate,persistenceType=persistenceType,orderType=orderType,side=side,itemDescription=itemDescription,priceRequested=priceRequested,settledDate=settledDate,betCount=betCount,commission=commission,priceMatched=priceMatched,priceReduced=priceReduced,sizeSettled=sizeSettled,profit=profit,sizeCancelled=sizeCancelled)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"ClearedOrderSummary")
  ret
}

SetOfClearedOrderSummary<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfClearedOrderSummary')
  return(lv)
}

ListOfClearedOrderSummary<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfClearedOrderSummary')
  return(lv)
}

################################################################################
#' @title  ClearedOrderSummaryReport
#' @description A container representing search results.
#' @param clearedOrders is mandatory of type ListOfClearedOrderSummary.
#'        The list of cleared orders returned by your query. This will be a
#'        valid list (i.e. empty or non-empty but never 'null'). 
#' @param moreAvailable is mandatory of type logical.
#'        Indicates whether there are further result items beyond this page.
#'        Note that underlying data is highly time-dependent and the subsequent
#'        search orders query might return an empty result. 
################################################################################
ClearedOrderSummaryReport<-function(clearedOrders,moreAvailable) {
  validateField(clearedOrders,'ListOfClearedOrderSummary',TRUE,'clearedOrders')
  validateField(moreAvailable,'logical',TRUE,'moreAvailable')

  ret=list(clearedOrders=clearedOrders,moreAvailable=moreAvailable)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"ClearedOrderSummaryReport")
  ret
}

SetOfClearedOrderSummaryReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfClearedOrderSummaryReport')
  return(lv)
}

ListOfClearedOrderSummaryReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfClearedOrderSummaryReport')
  return(lv)
}

################################################################################
#' @title  ItemDescription
#' @description This object contains some text which may be useful to render a betting
#' history view. It offers no long-term warranty as to the correctness of the
#' text. 
#' @param eventTypeDesc is optional of type character.
#'        The event type name, translated into the requested locale. Available
#'        at EVENT_TYPE groupBy or lower. 
#' @param eventDesc is optional of type character.
#'        The eventName, or openDate + venue, translated into the requested
#'        locale. Available at EVENT groupBy or lower. 
#' @param marketDesc is optional of type character.
#'        The market name or racing market type ("Win", "To Be Placed (2
#'        places)", "To Be Placed (5 places)" etc) translated into the requested
#'        locale. Available at MARKET groupBy or lower. 
#' @param marketStartTime is optional of type dateTime.
#'        The start time of the market (in ISO-8601 format, not translated).
#'        Available at MARKET groupBy or lower. 
#' @param runnerDesc is optional of type character.
#'        The runner name, maybe including the handicap, translated into the
#'        requested locale. Available at BET groupBy. 
#' @param numberOfWinners is optional of type integer.
#'        The numberOfWinners on a market. Available at BET groupBy.
################################################################################
ItemDescription<-function(eventTypeDesc=NULL,eventDesc=NULL,marketDesc=NULL,marketStartTime=NULL,runnerDesc=NULL,numberOfWinners=NULL) {
  validateField(eventTypeDesc,'character',FALSE,'eventTypeDesc')
  validateField(eventDesc,'character',FALSE,'eventDesc')
  validateField(marketDesc,'character',FALSE,'marketDesc')
  validateDateTime(marketStartTime,'dateTime',FALSE,'marketStartTime')
  validateField(runnerDesc,'character',FALSE,'runnerDesc')
  validateField(numberOfWinners,'integer',FALSE,'numberOfWinners')

  ret=list(eventTypeDesc=eventTypeDesc,eventDesc=eventDesc,marketDesc=marketDesc,marketStartTime=marketStartTime,runnerDesc=runnerDesc,numberOfWinners=numberOfWinners)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"ItemDescription")
  ret
}

SetOfItemDescription<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfItemDescription')
  return(lv)
}

ListOfItemDescription<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfItemDescription')
  return(lv)
}

################################################################################
#' @title  RunnerId
#' @description This object contains the unique identifier for a runner
#' @param marketId is mandatory of type character.
#'        The id of the market bet on
#' @param selectionId is mandatory of type integer.
#'        The id of the selection bet on
#' @param handicap is optional of type numeric.
#'        The handicap associated with the runner in case of asian handicap
#'        markets, null otherwise. 
################################################################################
RunnerId<-function(marketId,selectionId,handicap=NULL) {
  validateField(marketId,'character',TRUE,'marketId')
  validateField(selectionId,'integer',TRUE,'selectionId')
  validateField(handicap,'numeric',FALSE,'handicap')

  ret=list(marketId=marketId,selectionId=selectionId,handicap=handicap)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"RunnerId")
  ret
}

SetOfRunnerId<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfRunnerId')
  return(lv)
}

ListOfRunnerId<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfRunnerId')
  return(lv)
}

################################################################################
#' @title  PlaceInstruction
#' @description Instruction to place a new order
#' @param orderType is mandatory of type OrderType.
#'        
#' @param selectionId is mandatory of type integer.
#'        The selection_id.
#' @param handicap is optional of type numeric.
#'        The handicap applied to the selection, if on an asian-style market.
#' @param side is mandatory of type Side.
#'        Back or Lay
#' @param limitOrder is optional of type LimitOrder.
#'        
#' @param limitOnCloseOrder is optional of type LimitOnCloseOrder.
#'        
#' @param marketOnCloseOrder is optional of type MarketOnCloseOrder.
#'        
################################################################################
PlaceInstruction<-function(orderType,selectionId,handicap=NULL,side,limitOrder=NULL,limitOnCloseOrder=NULL,marketOnCloseOrder=NULL) {
  validateField(orderType,'OrderType',TRUE,'orderType')
  validateField(selectionId,'integer',TRUE,'selectionId')
  validateField(handicap,'numeric',FALSE,'handicap')
  validateField(side,'Side',TRUE,'side')
  validateField(limitOrder,'LimitOrder',FALSE,'limitOrder')
  validateField(limitOnCloseOrder,'LimitOnCloseOrder',FALSE,'limitOnCloseOrder')
  validateField(marketOnCloseOrder,'MarketOnCloseOrder',FALSE,'marketOnCloseOrder')

  ret=list(orderType=orderType,selectionId=selectionId,handicap=handicap,side=side,limitOrder=limitOrder,limitOnCloseOrder=limitOnCloseOrder,marketOnCloseOrder=marketOnCloseOrder)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"PlaceInstruction")
  ret
}

SetOfPlaceInstruction<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfPlaceInstruction')
  return(lv)
}

ListOfPlaceInstruction<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfPlaceInstruction')
  return(lv)
}

################################################################################
#' @title  PlaceExecutionReport
#' @param customerRef is optional of type character.
#'        Echo of the customerRef if passed. 
#' @param status is mandatory of type character.
#'        
#' @param errorCode is optional of type character.
#'        
#' @param marketId is optional of type character.
#'        Echo of marketId passed
#' @param instructionReports is optional of type ListOfPlaceInstructionReport.
#'        
################################################################################
PlaceExecutionReport<-function(customerRef=NULL,status,errorCode=NULL,marketId=NULL,instructionReports=NULL) {
  validateField(customerRef,'character',FALSE,'customerRef')
  validateField(status,'character',TRUE,'status')
  validateField(errorCode,'character',FALSE,'errorCode')
  validateField(marketId,'character',FALSE,'marketId')
  validateField(instructionReports,'ListOfPlaceInstructionReport',FALSE,'instructionReports')

  ret=list(customerRef=customerRef,status=status,errorCode=errorCode,marketId=marketId,instructionReports=instructionReports)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"PlaceExecutionReport")
  ret
}

SetOfPlaceExecutionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfPlaceExecutionReport')
  return(lv)
}

ListOfPlaceExecutionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfPlaceExecutionReport')
  return(lv)
}

################################################################################
#' @title  LimitOrder
#' @description Place a new LIMIT order (simple exchange bet for immediate execution)
#' @param size is mandatory of type numeric.
#'        The size of the bet.
#' @param price is mandatory of type numeric.
#'        The limit price
#' @param persistenceType is mandatory of type PersistenceType.
#'        What to do with the order at turn-in-play
################################################################################
LimitOrder<-function(size,price,persistenceType) {
  validateField(size,'numeric',TRUE,'size')
  validateField(price,'numeric',TRUE,'price')
  validateField(persistenceType,'PersistenceType',TRUE,'persistenceType')

  ret=list(size=size,price=price,persistenceType=persistenceType)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"LimitOrder")
  ret
}

SetOfLimitOrder<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfLimitOrder')
  return(lv)
}

ListOfLimitOrder<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfLimitOrder')
  return(lv)
}

################################################################################
#' @title  LimitOnCloseOrder
#' @description Place a new LIMIT_ON_CLOSE bet
#' @param liability is mandatory of type numeric.
#'        The size of the bet.
#' @param price is mandatory of type numeric.
#'        The limit price of the bet if LOC
################################################################################
LimitOnCloseOrder<-function(liability,price) {
  validateField(liability,'numeric',TRUE,'liability')
  validateField(price,'numeric',TRUE,'price')

  ret=list(liability=liability,price=price)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"LimitOnCloseOrder")
  ret
}

SetOfLimitOnCloseOrder<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfLimitOnCloseOrder')
  return(lv)
}

ListOfLimitOnCloseOrder<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfLimitOnCloseOrder')
  return(lv)
}

################################################################################
#' @title  MarketOnCloseOrder
#' @description Place a new MARKET_ON_CLOSE bet
#' @param liability is mandatory of type numeric.
#'        The size of the bet.
################################################################################
MarketOnCloseOrder<-function(liability) {
  validateField(liability,'numeric',TRUE,'liability')

  ret=list(liability=liability)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"MarketOnCloseOrder")
  ret
}

SetOfMarketOnCloseOrder<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfMarketOnCloseOrder')
  return(lv)
}

ListOfMarketOnCloseOrder<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfMarketOnCloseOrder')
  return(lv)
}

################################################################################
#' @title  PlaceInstructionReport
#' @description Response to a PlaceInstruction
#' @param status is mandatory of type character.
#'        whether the command succeeded or failed
#' @param errorCode is optional of type character.
#'        cause of failure, or null if command succeeds
#' @param instruction is mandatory of type PlaceInstruction.
#'        The instruction that was requested
#' @param betId is optional of type character.
#'        The bet ID of the new bet. May be null on failure.
#' @param placedDate is optional of type dateTime.
#'        
#' @param averagePriceMatched is optional of type numeric.
#'        
#' @param sizeMatched is optional of type numeric.
#'        
################################################################################
PlaceInstructionReport<-function(status,errorCode=NULL,instruction,betId=NULL,placedDate=NULL,averagePriceMatched=NULL,sizeMatched=NULL) {
  validateField(status,'character',TRUE,'status')
  validateField(errorCode,'character',FALSE,'errorCode')
  validateField(instruction,'PlaceInstruction',TRUE,'instruction')
  validateField(betId,'character',FALSE,'betId')
  validateDateTime(placedDate,'dateTime',FALSE,'placedDate')
  validateField(averagePriceMatched,'numeric',FALSE,'averagePriceMatched')
  validateField(sizeMatched,'numeric',FALSE,'sizeMatched')

  ret=list(status=status,errorCode=errorCode,instruction=instruction,betId=betId,placedDate=placedDate,averagePriceMatched=averagePriceMatched,sizeMatched=sizeMatched)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"PlaceInstructionReport")
  ret
}

SetOfPlaceInstructionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfPlaceInstructionReport')
  return(lv)
}

ListOfPlaceInstructionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfPlaceInstructionReport')
  return(lv)
}

################################################################################
#' @title  CancelInstruction
#' @description Instruction to fully or partially cancel an order (only applies to LIMIT
#' orders)
#' @param betId is mandatory of type character.
#'        
#' @param sizeReduction is optional of type numeric.
#'        If supplied then this is a partial cancel
################################################################################
CancelInstruction<-function(betId,sizeReduction=NULL) {
  validateField(betId,'character',TRUE,'betId')
  validateField(sizeReduction,'numeric',FALSE,'sizeReduction')

  ret=list(betId=betId,sizeReduction=sizeReduction)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"CancelInstruction")
  ret
}

SetOfCancelInstruction<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfCancelInstruction')
  return(lv)
}

ListOfCancelInstruction<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfCancelInstruction')
  return(lv)
}

################################################################################
#' @title  CancelExecutionReport
#' @param customerRef is optional of type character.
#'        Echo of the customerRef if passed. 
#' @param status is mandatory of type character.
#'        
#' @param errorCode is optional of type character.
#'        
#' @param marketId is optional of type character.
#'        Echo of marketId passed
#' @param instructionReports is optional of type ListOfCancelInstructionReport.
#'        
################################################################################
CancelExecutionReport<-function(customerRef=NULL,status,errorCode=NULL,marketId=NULL,instructionReports=NULL) {
  validateField(customerRef,'character',FALSE,'customerRef')
  validateField(status,'character',TRUE,'status')
  validateField(errorCode,'character',FALSE,'errorCode')
  validateField(marketId,'character',FALSE,'marketId')
  validateField(instructionReports,'ListOfCancelInstructionReport',FALSE,'instructionReports')

  ret=list(customerRef=customerRef,status=status,errorCode=errorCode,marketId=marketId,instructionReports=instructionReports)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"CancelExecutionReport")
  ret
}

SetOfCancelExecutionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfCancelExecutionReport')
  return(lv)
}

ListOfCancelExecutionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfCancelExecutionReport')
  return(lv)
}

################################################################################
#' @title  ReplaceInstruction
#' @description Instruction to replace a LIMIT or LIMIT_ON_CLOSE order at a new price.
#' Original order will be cancelled and a new order placed at the new price for
#' the remaining stake. 
#' @param betId is mandatory of type character.
#'        
#' @param newPrice is mandatory of type numeric.
#'        The price to replace the bet at
################################################################################
ReplaceInstruction<-function(betId,newPrice) {
  validateField(betId,'character',TRUE,'betId')
  validateField(newPrice,'numeric',TRUE,'newPrice')

  ret=list(betId=betId,newPrice=newPrice)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"ReplaceInstruction")
  ret
}

SetOfReplaceInstruction<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfReplaceInstruction')
  return(lv)
}

ListOfReplaceInstruction<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfReplaceInstruction')
  return(lv)
}

################################################################################
#' @title  ReplaceExecutionReport
#' @param customerRef is optional of type character.
#'        Echo of the customerRef if passed. 
#' @param status is mandatory of type character.
#'        
#' @param errorCode is optional of type character.
#'        
#' @param marketId is optional of type character.
#'        Echo of marketId passed
#' @param instructionReports is optional of type ListOfReplaceInstructionReport.
#'        
################################################################################
ReplaceExecutionReport<-function(customerRef=NULL,status,errorCode=NULL,marketId=NULL,instructionReports=NULL) {
  validateField(customerRef,'character',FALSE,'customerRef')
  validateField(status,'character',TRUE,'status')
  validateField(errorCode,'character',FALSE,'errorCode')
  validateField(marketId,'character',FALSE,'marketId')
  validateField(instructionReports,'ListOfReplaceInstructionReport',FALSE,'instructionReports')

  ret=list(customerRef=customerRef,status=status,errorCode=errorCode,marketId=marketId,instructionReports=instructionReports)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"ReplaceExecutionReport")
  ret
}

SetOfReplaceExecutionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfReplaceExecutionReport')
  return(lv)
}

ListOfReplaceExecutionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfReplaceExecutionReport')
  return(lv)
}

################################################################################
#' @title  ReplaceInstructionReport
#' @param status is mandatory of type character.
#'        whether the command succeeded or failed
#' @param errorCode is optional of type character.
#'        cause of failure, or null if command succeeds
#' @param cancelInstructionReport is optional of type CancelInstructionReport.
#'        Cancelation report for the original order
#' @param placeInstructionReport is optional of type PlaceInstructionReport.
#'        Placement report for the new order
################################################################################
ReplaceInstructionReport<-function(status,errorCode=NULL,cancelInstructionReport=NULL,placeInstructionReport=NULL) {
  validateField(status,'character',TRUE,'status')
  validateField(errorCode,'character',FALSE,'errorCode')
  validateField(cancelInstructionReport,'CancelInstructionReport',FALSE,'cancelInstructionReport')
  validateField(placeInstructionReport,'PlaceInstructionReport',FALSE,'placeInstructionReport')

  ret=list(status=status,errorCode=errorCode,cancelInstructionReport=cancelInstructionReport,placeInstructionReport=placeInstructionReport)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"ReplaceInstructionReport")
  ret
}

SetOfReplaceInstructionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfReplaceInstructionReport')
  return(lv)
}

ListOfReplaceInstructionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfReplaceInstructionReport')
  return(lv)
}

################################################################################
#' @title  CancelInstructionReport
#' @param status is mandatory of type character.
#'        whether the command succeeded or failed
#' @param errorCode is optional of type character.
#'        cause of failure, or null if command succeeds
#' @param instruction is optional of type CancelInstruction.
#'        The instruction that was requested
#' @param sizeCancelled is mandatory of type numeric.
#'        
#' @param cancelledDate is mandatory of type dateTime.
#'        
################################################################################
CancelInstructionReport<-function(status,errorCode=NULL,instruction=NULL,sizeCancelled,cancelledDate) {
  validateField(status,'character',TRUE,'status')
  validateField(errorCode,'character',FALSE,'errorCode')
  validateField(instruction,'CancelInstruction',FALSE,'instruction')
  validateField(sizeCancelled,'numeric',TRUE,'sizeCancelled')
  validateDateTime(cancelledDate,'dateTime',TRUE,'cancelledDate')

  ret=list(status=status,errorCode=errorCode,instruction=instruction,sizeCancelled=sizeCancelled,cancelledDate=cancelledDate)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"CancelInstructionReport")
  ret
}

SetOfCancelInstructionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfCancelInstructionReport')
  return(lv)
}

ListOfCancelInstructionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfCancelInstructionReport')
  return(lv)
}

################################################################################
#' @title  UpdateInstruction
#' @description Instruction to update LIMIT bet's persistence of an order that do not affect
#' exposure
#' @param betId is mandatory of type character.
#'        
#' @param newPersistenceType is mandatory of type PersistenceType.
#'        The new persistence type to update this bet to
################################################################################
UpdateInstruction<-function(betId,newPersistenceType) {
  validateField(betId,'character',TRUE,'betId')
  validateField(newPersistenceType,'PersistenceType',TRUE,'newPersistenceType')

  ret=list(betId=betId,newPersistenceType=newPersistenceType)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"UpdateInstruction")
  ret
}

SetOfUpdateInstruction<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfUpdateInstruction')
  return(lv)
}

ListOfUpdateInstruction<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfUpdateInstruction')
  return(lv)
}

################################################################################
#' @title  UpdateExecutionReport
#' @param customerRef is optional of type character.
#'        Echo of the customerRef if passed. 
#' @param status is mandatory of type character.
#'        
#' @param errorCode is optional of type character.
#'        
#' @param marketId is optional of type character.
#'        Echo of marketId passed
#' @param instructionReports is optional of type ListOfUpdateInstructionReport.
#'        
################################################################################
UpdateExecutionReport<-function(customerRef=NULL,status,errorCode=NULL,marketId=NULL,instructionReports=NULL) {
  validateField(customerRef,'character',FALSE,'customerRef')
  validateField(status,'character',TRUE,'status')
  validateField(errorCode,'character',FALSE,'errorCode')
  validateField(marketId,'character',FALSE,'marketId')
  validateField(instructionReports,'ListOfUpdateInstructionReport',FALSE,'instructionReports')

  ret=list(customerRef=customerRef,status=status,errorCode=errorCode,marketId=marketId,instructionReports=instructionReports)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"UpdateExecutionReport")
  ret
}

SetOfUpdateExecutionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfUpdateExecutionReport')
  return(lv)
}

ListOfUpdateExecutionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfUpdateExecutionReport')
  return(lv)
}

################################################################################
#' @title  UpdateInstructionReport
#' @param status is mandatory of type character.
#'        whether the command succeeded or failed
#' @param errorCode is optional of type character.
#'        cause of failure, or null if command succeeds
#' @param instruction is mandatory of type UpdateInstruction.
#'        The instruction that was requested
################################################################################
UpdateInstructionReport<-function(status,errorCode=NULL,instruction) {
  validateField(status,'character',TRUE,'status')
  validateField(errorCode,'character',FALSE,'errorCode')
  validateField(instruction,'UpdateInstruction',TRUE,'instruction')

  ret=list(status=status,errorCode=errorCode,instruction=instruction)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"UpdateInstructionReport")
  ret
}

SetOfUpdateInstructionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfUpdateInstructionReport')
  return(lv)
}

ListOfUpdateInstructionReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfUpdateInstructionReport')
  return(lv)
}

################################################################################
#' @title  PriceProjection
#' @description Selection criteria of the returning price data 
#' @param priceData is optional of type SetOfPriceData.
#'        The basic price data you want to receive in the response. 
#' @param exBestOffersOverrides is optional of type ExBestOffersOverrides.
#'        Options to alter the default representation of best offer prices
#'        Applicable to EX_BEST_OFFERS priceData selection 
#' @param virtualise is optional of type logical.
#'        Indicates if the returned prices should include virtual prices.
#'        Applicable to EX_BEST_OFFERS and EX_ALL_OFFERS priceData selections,
#'        default value is false. 
#' @param rolloverStakes is optional of type logical.
#'        Indicates if the volume returned at each price point should be the
#'        absolute value or a cumulative sum of volumes available at the price
#'        and all better prices. If unspecified defaults to false. Applicable to
#'        EX_BEST_OFFERS and EX_ALL_OFFERS price projections. Not supported as
#'        yet. 
################################################################################
PriceProjection<-function(priceData=NULL,exBestOffersOverrides=NULL,virtualise=NULL,rolloverStakes=NULL) {
  validateField(priceData,'SetOfPriceData',FALSE,'priceData')
  validateField(exBestOffersOverrides,'ExBestOffersOverrides',FALSE,'exBestOffersOverrides')
  validateField(virtualise,'logical',FALSE,'virtualise')
  validateField(rolloverStakes,'logical',FALSE,'rolloverStakes')

  ret=list(priceData=priceData,exBestOffersOverrides=exBestOffersOverrides,virtualise=virtualise,rolloverStakes=rolloverStakes)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"PriceProjection")
  ret
}

SetOfPriceProjection<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfPriceProjection')
  return(lv)
}

ListOfPriceProjection<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfPriceProjection')
  return(lv)
}

################################################################################
#' @title  ExBestOffersOverrides
#' @description Options to alter the default representation of best offer prices 
#' @param bestPricesDepth is optional of type integer.
#'        The maximum number of prices to return on each side for each runner.
#'        If unspecified defaults to 3. 
#' @param rollupModel is optional of type RollupModel.
#'        The model to use when rolling up available sizes. If unspecified
#'        defaults to STAKE rollup model with rollupLimit of minimum stake in
#'        the specified currency. 
#' @param rollupLimit is optional of type integer.
#'        The volume limit to use when rolling up returned sizes. The exact
#'        definition of the limit depends on the rollupModel. If no limit is
#'        provided it will use minimum stake as default the value. Ignored if no
#'        rollup model is specified. 
#' @param rollupLiabilityThreshold is optional of type numeric.
#'        Only applicable when rollupModel is MANAGED_LIABILITY. The rollup
#'        model switches from being stake based to liability based at the
#'        smallest lay price which is >= rollupLiabilityThreshold.service level
#'        default (TBD). Not supported as yet. 
#' @param rollupLiabilityFactor is optional of type integer.
#'        Only applicable when rollupModel is MANAGED_LIABILITY.
#'        (rollupLiabilityFactor * rollupLimit) is the minimum liabilty the user
#'        is deemed to be comfortable with. After the rollupLiabilityThreshold
#'        price subsequent volumes will be rolled up to minimum value such that
#'        the liability >= the minimum liability.service level default (5). Not
#'        supported as yet. 
################################################################################
ExBestOffersOverrides<-function(bestPricesDepth=NULL,rollupModel=NULL,rollupLimit=NULL,rollupLiabilityThreshold=NULL,rollupLiabilityFactor=NULL) {
  validateField(bestPricesDepth,'integer',FALSE,'bestPricesDepth')
  validateField(rollupModel,'RollupModel',FALSE,'rollupModel')
  validateField(rollupLimit,'integer',FALSE,'rollupLimit')
  validateField(rollupLiabilityThreshold,'numeric',FALSE,'rollupLiabilityThreshold')
  validateField(rollupLiabilityFactor,'integer',FALSE,'rollupLiabilityFactor')

  ret=list(bestPricesDepth=bestPricesDepth,rollupModel=rollupModel,rollupLimit=rollupLimit,rollupLiabilityThreshold=rollupLiabilityThreshold,rollupLiabilityFactor=rollupLiabilityFactor)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"ExBestOffersOverrides")
  ret
}

SetOfExBestOffersOverrides<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfExBestOffersOverrides')
  return(lv)
}

ListOfExBestOffersOverrides<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfExBestOffersOverrides')
  return(lv)
}

################################################################################
#' @title  MarketProfitAndLoss
#' @description Profit and loss in a market
#' @param marketId is optional of type character.
#'        The unique identifier for the market
#' @param commissionApplied is optional of type numeric.
#'        The commission rate applied to P&L values. Only returned if
#'        netOfCommision option is requested 
#' @param profitAndLosses is optional of type ListOfRunnerProfitAndLoss.
#'        Calculated profit and loss data. 
################################################################################
MarketProfitAndLoss<-function(marketId=NULL,commissionApplied=NULL,profitAndLosses=NULL) {
  validateField(marketId,'character',FALSE,'marketId')
  validateField(commissionApplied,'numeric',FALSE,'commissionApplied')
  validateField(profitAndLosses,'ListOfRunnerProfitAndLoss',FALSE,'profitAndLosses')

  ret=list(marketId=marketId,commissionApplied=commissionApplied,profitAndLosses=profitAndLosses)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"MarketProfitAndLoss")
  ret
}

SetOfMarketProfitAndLoss<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfMarketProfitAndLoss')
  return(lv)
}

ListOfMarketProfitAndLoss<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfMarketProfitAndLoss')
  return(lv)
}

################################################################################
#' @title  RunnerProfitAndLoss
#' @description Profit and loss if selection is wins or loses
#' @param selectionId is optional of type integer.
#'        The unique identifier for the selection
#' @param ifWin is optional of type numeric.
#'        Profit and loss for the market if this selection is the winner 
#' @param ifLose is optional of type numeric.
#'        Profit and loss for the market if this selection is the loser. Only
#'        returned for multi-winner odds markets. 
################################################################################
RunnerProfitAndLoss<-function(selectionId=NULL,ifWin=NULL,ifLose=NULL) {
  validateField(selectionId,'integer',FALSE,'selectionId')
  validateField(ifWin,'numeric',FALSE,'ifWin')
  validateField(ifLose,'numeric',FALSE,'ifLose')

  ret=list(selectionId=selectionId,ifWin=ifWin,ifLose=ifLose)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"RunnerProfitAndLoss")
  ret
}

SetOfRunnerProfitAndLoss<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfRunnerProfitAndLoss')
  return(lv)
}

ListOfRunnerProfitAndLoss<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfRunnerProfitAndLoss')
  return(lv)
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
#' @return  output data
################################################################################
json.listEventTypes<-function(filter=MarketFilter(), locale=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
    params = list(filter=filter, locale=locale )
  run.operation('listEventTypes',params,exchange,appKey,sessionToken,api='betting')
}

r.listEventTypes<-function(filter=MarketFilter(), locale=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.listEventTypes(filter=filter, locale=locale , exchange=exchange,
 appKey=appKey, sessionToken=sessionToken)
  toR(ret)
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
#' @return  output data
################################################################################
json.listCompetitions<-function(filter=MarketFilter(), locale=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
    params = list(filter=filter, locale=locale )
  run.operation('listCompetitions',params,exchange,appKey,sessionToken,api='betting')
}

r.listCompetitions<-function(filter=MarketFilter(), locale=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.listCompetitions(filter=filter, locale=locale , exchange=exchange,
 appKey=appKey, sessionToken=sessionToken)
  toR(ret)
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
#' @return  output data
################################################################################
json.listTimeRanges<-function(filter=MarketFilter(),
  granularity=TimeGranularity() , exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
    params = list(filter=filter, granularity=granularity )
  run.operation('listTimeRanges',params,exchange,appKey,sessionToken,api='betting')
}

r.listTimeRanges<-function(filter=MarketFilter(), granularity=TimeGranularity()
  , exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.listTimeRanges(filter=filter, granularity=granularity ,
 exchange=exchange, appKey=appKey, sessionToken=sessionToken)
  toR(ret)
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
#' @return  output data
################################################################################
json.listEvents<-function(filter=MarketFilter(), locale=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
    params = list(filter=filter, locale=locale )
  run.operation('listEvents',params,exchange,appKey,sessionToken,api='betting')
}

r.listEvents<-function(filter=MarketFilter(), locale=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.listEvents(filter=filter, locale=locale , exchange=exchange,
 appKey=appKey, sessionToken=sessionToken)
  toR(ret)
}

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
################################################################################
json.listMarketTypes<-function(filter=MarketFilter(), locale=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
    params = list(filter=filter, locale=locale )
  run.operation('listMarketTypes',params,exchange,appKey,sessionToken,api='betting')
}

r.listMarketTypes<-function(filter=MarketFilter(), locale=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.listMarketTypes(filter=filter, locale=locale , exchange=exchange,
 appKey=appKey, sessionToken=sessionToken)
  toR(ret)
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
#'          returned. 
#' @return  output data
################################################################################
json.listCountries<-function(filter=MarketFilter(), locale=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
    params = list(filter=filter, locale=locale )
  run.operation('listCountries',params,exchange,appKey,sessionToken,api='betting')
}

r.listCountries<-function(filter=MarketFilter(), locale=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.listCountries(filter=filter, locale=locale , exchange=exchange,
 appKey=appKey, sessionToken=sessionToken)
  toR(ret)
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
#' @return  output data
################################################################################
json.listVenues<-function(filter=MarketFilter(), locale=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
    params = list(filter=filter, locale=locale )
  run.operation('listVenues',params,exchange,appKey,sessionToken,api='betting')
}

r.listVenues<-function(filter=MarketFilter(), locale=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.listVenues(filter=filter, locale=locale , exchange=exchange,
 appKey=appKey, sessionToken=sessionToken)
  toR(ret)
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
#' @return  output data
################################################################################
json.listMarketCatalogue<-function(filter=MarketFilter(), marketProjection=NULL,
  sort=NULL, maxResults=i32(), locale=NULL , exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  params = list(filter=filter, marketProjection=marketProjection, sort=sort,
  maxResults=maxResults, locale=locale )
  run.operation('listMarketCatalogue',params,exchange,appKey,sessionToken,api='betting')
}

r.listMarketCatalogue<-function(filter=MarketFilter(), marketProjection=NULL,
  sort=NULL, maxResults=i32(), locale=NULL , exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.listMarketCatalogue(filter=filter, marketProjection=marketProjection,
 sort=sort, maxResults=maxResults, locale=locale , exchange=exchange,
 appKey=appKey, sessionToken=sessionToken)
  toR(ret)
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
################################################################################
json.listMarketBook<-function(marketIds=ListOfMarketId(), priceProjection=NULL,
  orderProjection=NULL, matchProjection=NULL, currencyCode=NULL, locale=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  params = list(marketIds=marketIds, priceProjection=priceProjection,
  orderProjection=orderProjection, matchProjection=matchProjection,
  currencyCode=currencyCode, locale=locale )
  run.operation('listMarketBook',params,exchange,appKey,sessionToken,api='betting')
}

r.listMarketBook<-function(marketIds=ListOfMarketId(), priceProjection=NULL,
  orderProjection=NULL, matchProjection=NULL, currencyCode=NULL, locale=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.listMarketBook(marketIds=marketIds, priceProjection=priceProjection,
 orderProjection=orderProjection, matchProjection=matchProjection,
 currencyCode=currencyCode, locale=locale , exchange=exchange, appKey=appKey,
 sessionToken=sessionToken)
  toR(ret)
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
################################################################################
json.listCurrentOrders<-function(betIds=NULL, marketIds=NULL,
  orderProjection=NULL, placedDateRange=NULL, dateRange=NULL, orderBy=NULL,
  sortDir=NULL, fromRecord=NULL, recordCount=NULL , exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  params = list(betIds=betIds, marketIds=marketIds,
  orderProjection=orderProjection, placedDateRange=placedDateRange,
  dateRange=dateRange, orderBy=orderBy, sortDir=sortDir, fromRecord=fromRecord,
  recordCount=recordCount )
  run.operation('listCurrentOrders',params,exchange,appKey,sessionToken,api='betting')
}

r.listCurrentOrders<-function(betIds=NULL, marketIds=NULL, orderProjection=NULL,
  placedDateRange=NULL, dateRange=NULL, orderBy=NULL, sortDir=NULL,
  fromRecord=NULL, recordCount=NULL , exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.listCurrentOrders(betIds=betIds, marketIds=marketIds,
 orderProjection=orderProjection, placedDateRange=placedDateRange,
 dateRange=dateRange, orderBy=orderBy, sortDir=sortDir, fromRecord=fromRecord,
 recordCount=recordCount , exchange=exchange, appKey=appKey,
 sessionToken=sessionToken)
  toR(ret)
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
################################################################################
json.listClearedOrders<-function(betStatus=BetStatus(), eventTypeIds=NULL,
  eventIds=NULL, marketIds=NULL, runnerIds=NULL, betIds=NULL, side=NULL,
  settledDateRange=NULL, groupBy=NULL, includeItemDescription=NULL, locale=NULL,
  fromRecord=NULL, recordCount=NULL , exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  params = list(betStatus=betStatus, eventTypeIds=eventTypeIds, eventIds=eventIds,
  marketIds=marketIds, runnerIds=runnerIds, betIds=betIds, side=side,
  settledDateRange=settledDateRange, groupBy=groupBy,
  includeItemDescription=includeItemDescription, locale=locale,
  fromRecord=fromRecord, recordCount=recordCount )
  run.operation('listClearedOrders',params,exchange,appKey,sessionToken,api='betting')
}

r.listClearedOrders<-function(betStatus=BetStatus(), eventTypeIds=NULL,
  eventIds=NULL, marketIds=NULL, runnerIds=NULL, betIds=NULL, side=NULL,
  settledDateRange=NULL, groupBy=NULL, includeItemDescription=NULL, locale=NULL,
  fromRecord=NULL, recordCount=NULL , exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.listClearedOrders(betStatus=betStatus, eventTypeIds=eventTypeIds,
 eventIds=eventIds, marketIds=marketIds, runnerIds=runnerIds, betIds=betIds,
 side=side, settledDateRange=settledDateRange, groupBy=groupBy,
 includeItemDescription=includeItemDescription, locale=locale,
 fromRecord=fromRecord, recordCount=recordCount , exchange=exchange,
 appKey=appKey, sessionToken=sessionToken)
  toR(ret)
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
################################################################################
json.placeOrders<-function(marketId=MarketId(),
  instructions=ListOfPlaceInstruction(), customerRef=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  params = list(marketId=marketId, instructions=instructions,
  customerRef=customerRef )
  run.operation('placeOrders',params,exchange,appKey,sessionToken,api='betting')
}

r.placeOrders<-function(marketId=MarketId(),
  instructions=ListOfPlaceInstruction(), customerRef=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.placeOrders(marketId=marketId, instructions=instructions,
 customerRef=customerRef , exchange=exchange, appKey=appKey,
 sessionToken=sessionToken)
  toR(ret)
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
################################################################################
json.cancelOrders<-function(marketId=NULL, instructions=NULL, customerRef=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  params = list(marketId=marketId, instructions=instructions,
  customerRef=customerRef )
  run.operation('cancelOrders',params,exchange,appKey,sessionToken,api='betting')
}

r.cancelOrders<-function(marketId=NULL, instructions=NULL, customerRef=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.cancelOrders(marketId=marketId, instructions=instructions,
 customerRef=customerRef , exchange=exchange, appKey=appKey,
 sessionToken=sessionToken)
  toR(ret)
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
################################################################################
json.replaceOrders<-function(marketId=MarketId(),
  instructions=ListOfReplaceInstruction(), customerRef=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  params = list(marketId=marketId, instructions=instructions,
  customerRef=customerRef )
  run.operation('replaceOrders',params,exchange,appKey,sessionToken,api='betting')
}

r.replaceOrders<-function(marketId=MarketId(),
  instructions=ListOfReplaceInstruction(), customerRef=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.replaceOrders(marketId=marketId, instructions=instructions,
 customerRef=customerRef , exchange=exchange, appKey=appKey,
 sessionToken=sessionToken)
  toR(ret)
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
################################################################################
json.updateOrders<-function(marketId=MarketId(),
  instructions=ListOfUpdateInstruction(), customerRef=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  params = list(marketId=marketId, instructions=instructions,
  customerRef=customerRef )
  run.operation('updateOrders',params,exchange,appKey,sessionToken,api='betting')
}

r.updateOrders<-function(marketId=MarketId(),
  instructions=ListOfUpdateInstruction(), customerRef=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.updateOrders(marketId=marketId, instructions=instructions,
 customerRef=customerRef , exchange=exchange, appKey=appKey,
 sessionToken=sessionToken)
  toR(ret)
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
################################################################################
json.listMarketProfitAndLoss<-function(marketIds=SetOfMarketId(),
  includeSettledBets=NULL, includeBspBets=NULL, netOfCommission=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  params = list(marketIds=marketIds, includeSettledBets=includeSettledBets,
  includeBspBets=includeBspBets, netOfCommission=netOfCommission )
  run.operation('listMarketProfitAndLoss',params,exchange,appKey,sessionToken,api='betting')
}

r.listMarketProfitAndLoss<-function(marketIds=SetOfMarketId(),
  includeSettledBets=NULL, includeBspBets=NULL, netOfCommission=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.listMarketProfitAndLoss(marketIds=marketIds,
 includeSettledBets=includeSettledBets, includeBspBets=includeBspBets,
 netOfCommission=netOfCommission , exchange=exchange, appKey=appKey,
 sessionToken=sessionToken)
  toR(ret)
}

