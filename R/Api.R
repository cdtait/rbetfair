################################################################################
#  Implementation:   Api
#  Description:      Runtime support at the heart of the conversation between
#                    betfair and the application
#  Version:          1.0.0
################################################################################

.BetfairEnv<-new.env()
# Deafult exhcnage is UK
.BetfairEnv$exchange<-'UK'
# Default certificate expected in R working directory
.BetfairEnv$sslcert<-'./client-2048.pem'

# Deafult no debug
.BetfairEnv$debug<-FALSE
# Default use rpc method
.BetfairEnv$method<-'RPC'

# International
.BetfairEnv$uk.url<-'https://api.betfair.com/exchange/'
# Austrialian
.BetfairEnv$au.url<-'https://api-au.betfair.com/exchange/'

.BetfairEnv$textGatherer<-basicTextGatherer()
.BetfairEnv$headerGatherer<-basicTextGatherer()

# Primitives alias used to match the XML naming types
string<-i64<-i32<-d32<-dateTime<-bool<-function(value) {value}

.onLoad <- function(lib, pkg) {
  p = c("bitops","RCurl","rjson","plyr")
  for(x in p)
    if(any(is.na(utils:::packageDescription(x)))) 
      install.packages(x,repos="http://cran.at.r-project.org/")
  
  for(x in p) do.call("require",list(package=x))
}

# Checks the value(s) are all contaied in the valid compare set 
validateSet<-function(values,name,validValues) {
  if (!is.null(values) && length(values) > 0 && !all(values %in% validValues))
	stop(paste0(name," values (",toString(values),") must be in (",toString(validValues),")"))
}

# Checks the expected name class is a subset of the value class
# Checks if mandatory
validateField<-function(value,name,mandatory,fieldName) {
  if (is.null(value) && mandatory) {
	 stop(paste0("Field:", fieldName, " is null when mandatory"))
  }
  else if (!is.null(value) && !any(name %in% class(value))) {
	 stop(paste0("Field:", fieldName, " expected class type of ",name," got ",class(value)))
  }
}

# ISO time format syntax
iso8601re = "^(-?(?:[1-9][0-9]*)?[0-9]{4})-(1[0-2]|0[1-9])-(3[0-1]|0[1-9]|[1-2][0-9])T(2[0-3]|[0-1][0-9]):([0-5][0-9]):([0-5][0-9])(\\.[0-9]+)?(Z|[+-](?:2[0-3]|[0-1][0-9]):[0-5][0-9])?$"
# Checks the datetime value against the iso format
# Checks if mandatory
validateDateTime<-function(value,name,mandatory,fieldName) {
  if (is.null(value) && mandatory) {
	 stop(paste0(name," is null when mandatory"))
  }
  else if (!is.null(value) && !grepl(iso8601re,value)) {
    stop(paste0("Datetime field:",fieldName," value:",value," is nor ISO 8601 "))
  }
}

################################################################################
#' @title run.operation
#' @description Main http operation with betfair API_NG json interface
#' @details
#'  This is responsible for -
#'  All the http work
#'  Using RCurl we can send a http request in either rpc or rest format
#'  It can select to use either AUS or GB locations based on the exchange parameter
#'  It can select the correct http extension to call the apropriate service API
#'  i.e Hearbeat, Sporst or Account APIs
#'  It will take params in the form of structured R lists/vectors and convert
#'  them to json format using rjson
#'  It handles the http response checking for any errors in the http header
#'  It returns the response as the raw json format
#' @usage run.operation<-function(method,params,exchange,
#'                                appKey=.BetfairEnv$appKey,
#'                                sessionToken=.BetfairEnv$sessionToken,
#'                                api='betting')
#' @param method product or application key
#' @param appKey betfair username
#' @param sessionToken betfair password
#' @param api
#' @return  response
################################################################################
run.operation<-function(method,params,exchange,appKey=.BetfairEnv$appKey,sessionToken=.BetfairEnv$sessionToken,api='betting') {
  params[sapply(params, is.null)] <- NULL
  headers<-c('X-Application'=appKey, 'X-Authentication'=sessionToken, 'content-type'='application/json')
  .BetfairEnv$textGatherer$reset()
  .BetfairEnv$headerGatherer$reset()
  if (!exists('curl',envir=.BetfairEnv,inherits = FALSE))
    .BetfairEnv$curl<-getCurlHandle()
  
  if (.BetfairEnv$method == 'RPC') {
    if (exchange == 'AUS') {
      url<-paste0(.BetfairEnv$au.url,api,'/json-rpc/v1')
    }
    else {
      url<-paste0(.BetfairEnv$uk.url,api,'/json-rpc/v1')
    }
  }
  else {
    # REST url service
    if (exchange == 'AUS') {
      url<-paste0(.BetfairEnv$au.url,api,'/rest/v1/',method,'/')
    }
    else {
      url<-paste0(.BetfairEnv$uk.url,api,'/rest/v1/',method,'/')
    }
  }
  
  if (.BetfairEnv$method == 'RPC') {
    if (api=='betting') {
      req=toJSON(list(jsonrpc='2.0', method=paste0('SportsAPING/v1.0/',method), params=params))
    }
    if (api=='heartbeat') {
      req=toJSON(list(jsonrpc='2.0', method=paste0('HeartbeatAPING/v1.0/',method),params=params))
    }
    if (api=='account') {
      req=toJSON(list(jsonrpc='2.0', method=paste0('AccountAPING/v1.0/',method), params=params))
    }
  }
  else {
    # We are REST
    req=toJSON(params)
  }

  if (.BetfairEnv$debug) message(paste0('Request:',req))

  curlPerform(url=url,
           httpheader=headers,
           postfields=req,
           verbose=.BetfairEnv$debug,
           writefunction = .BetfairEnv$textGatherer$update,
           headerfunction = .BetfairEnv$headerGatherer$update,
           curl=.BetfairEnv$curl
        )
  
  httpHeader<-parseHTTPHeader(.BetfairEnv$headerGatherer$value())
  if (httpHeader[['status']]=="200") {
    response<-.BetfairEnv$textGatherer$value()
  
    if (.BetfairEnv$debug) {
      message(paste0("HTTP header: ",
                  httpHeader[['status']]," ",
                  httpHeader[['statusMessage']]," ",
                  httpHeader[['Date']]))
    }
    if (.BetfairEnv$debug) message(paste0('Response:',response))

    return(response)
  }  
  else {
    stop(paste0("HTTP error: ",
                httpHeader[['status']]," ",
                httpHeader[['statusMessage']]," ",
                httpHeader[['Date']]))
  }
}

# Convert from JSON to R
# Check any API exceptions and raise 
toR<-function(retjson) {
  ret <- fromJSON(retjson)
  if (!is.null(ret[["result"]])) {
	 return(ret)
  }
  else if (!is.null(ret[["error"]])) {
	 message(paste0("Error Code:",ret$error$code))
	 message(paste0("Error Message:",ret$error$message))
	 APINGException(ret$error$data$APINGException$errorCode,
	                ret$error$data$APINGException$errorDetails,
	                ret$error$data$APINGException$requestUUID)
  }
  else {
	 stop("Unknown return type")
  }
}

# The following functions way of adding the class name to the set of values
# The validValues may be for example charachter representing
# some type. We are adding the n name ass the class name of the
# set so that the class type itsself as a sub item of a list
# can be validated.
# For example - If we look at Market filter we can define this as
#
#  filter=MarketFilter(eventTypeIds=SetOfEventTypeId(horseRacingTypeId),
#                      marketCountries=SetOfCountryCode(countryCode),
#                      marketTypeCodes=SetOfMarketType("WIN"),
#                      marketStartTime=TimeRange(from=format(Sys.Date(),"%Y-%m-%dT%H:%M:%SZ")))
#
# MarketFilter is a type which would check all the types contained within it
# So marketTypeCodes would be checked to see if it was a MarketType and it does this with
# the class name of the value i.e class(marketTypeCodes) so that should have MarketType and
# maybe other class names for checking
# So SetOfMarketType which is a SetoV as below is a way of adding type information and check
# the values of set

# Generic
ItemOfV<-function(lv,n,validValues,t='') {
  validateSet(lv,n,validValues)
  class(lv) <- append(class(lv),paste0(t,n))
  return(lv)
}

SetOfV<-function(lv,n,validValues) {
  ItemOfV(lv,n,validValues,t='SetOf')
}

ListOfV<-function(lv,n,validValues) {
  ItemOfV(lv,n,validValues,t='ListOf')
}

# No validation types
# i.e SetOfMarketType according to the SportsAPING
# MarketType is just a string and has no validation set
# so we require a list/set with no value validation apart
# from the class name itself

ItemOf<-function(lv,n,t='') {
  class(lv) <- append(class(lv),paste0(t,n))
  return(lv)
}

SetOf<-function(lv,n,validValues) {
  ItemOf(lv,n,t='SetOf')
}

# No validation type
ListOf<-function(lv,n,validValues) {
  ItemOf(lv,n,t='ListOf')
}

