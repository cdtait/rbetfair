################################################################################
#  Interface:   HeartbeatAPING
#  Description: Heartbeat
#  Version:     1.0.0
#  Owner:       BDP
#  Date:        now()
#  Generated:   08-Oct-2014
################################################################################

################################################################################
#' @title ActionPerformed
#' @description ActionPerformed
#' @usage ActionPerformed(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     NONE
#'            No action was performed since last heartbeat, or this is the first
#'            heartbeat
#'     }
#'     \item {     CANCELLATION_REQUEST_SUBMITTED
#'            A request to cancel all unmatched bets was submitted since last
#'            heartbeat
#'     }
#'     \item {     ALL_BETS_CANCELLED
#'            All unmatched bets were cancelled since last heartbeat
#'     }
#'     \item {     SOME_BETS_NOT_CANCELLED
#'            Not all unmatched bets were cancelled since last heartbeat
#'     }
#'     \item {     CANCELLATION_REQUEST_ERROR
#'            There was an error requesting cancellation, no bets have been
#'            cancelled
#'     }
#'     \item {     CANCELLATION_STATUS_UNKNOWN
#'            There was no response from requesting cancellation, cancellation
#'            status unknown
#'     }
#'   }
#' }
################################################################################
ActionPerformedValidValues=c("NONE","CANCELLATION_REQUEST_SUBMITTED","ALL_BETS_CANCELLED","SOME_BETS_NOT_CANCELLED","CANCELLATION_REQUEST_ERROR","CANCELLATION_STATUS_UNKNOWN")
ActionPerformed<-function(values) {
  validateSet(values,'ActionPerformed',ActionPerformedValidValues)
  class(values) <- append(class(values),"ActionPerformed")
  return(values)
}
SetOfActionPerformed<-function(...) { SetOfV(list(...),'ActionPerformed',ActionPerformedValidValues) }
ListOfActionPerformed<-function(...) { ListOfV(list(...),'ActionPerformed',ActionPerformedValidValues) }

################################################################################
#' @title  HeartbeatReport
#' @description Response from heartbeat operation
#' @param actionPerformed is mandatory of type ActionPerformed.
#'        The action performed since your last heartbeat request.
#' @param actualTimeoutSeconds is mandatory of type integer.
#'        The actual timeout applied to your heartbeat request, see timeout
#'        request parameter description for details. 
################################################################################
HeartbeatReport<-function(actionPerformed,actualTimeoutSeconds) {
  validateField(actionPerformed,'ActionPerformed',TRUE,'actionPerformed')
  validateField(actualTimeoutSeconds,'integer',TRUE,'actualTimeoutSeconds')

  ret=list(actionPerformed=actionPerformed,actualTimeoutSeconds=actualTimeoutSeconds)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"HeartbeatReport")
  ret
}

SetOfHeartbeatReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfHeartbeatReport')
  return(lv)
}

ListOfHeartbeatReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfHeartbeatReport')
  return(lv)
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
#' @return  Response from heartbeat operation
################################################################################
json.heartbeat<-function(preferredTimeoutSeconds=i32() ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
    params = list(preferredTimeoutSeconds=preferredTimeoutSeconds )
  run.operation('heartbeat',params,exchange,appKey,sessionToken,api='heartbeat')
}

r.heartbeat<-function(preferredTimeoutSeconds=i32() ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.heartbeat(preferredTimeoutSeconds=preferredTimeoutSeconds ,
 exchange=exchange, appKey=appKey, sessionToken=sessionToken)
  toR(ret)
}

