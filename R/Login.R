################################################################################
#  Implementation:   Login
#  Description:      Login with or without certificate. Also has keep alive
#  Version:          1.0.0
################################################################################

################################################################################
#' @title login
#' @description Login with no certificate
#' @usage login(appKey,username,password)
#' @param appKey product or application key
#' @param username betfair username
#' @param password betfair password
#' @return  list(status,token,product,status,error)
################################################################################
login<-function(appKey,username,password) {
  headers<-c('X-Application'=appKey, 'Accept'='application/json')
  url<-"https://identitysso.betfair.com/api/login"
  req<-paste0('username=',username,'&password=',password)
  .BetfairEnv$textGatherer$reset()
  .BetfairEnv$headerGatherer$reset()
  
  if (.BetfairEnv$debug) message(paste0('Request:',req))
  
  curlPerform(url=url,
  	          httpheader=headers,
  	          postfields=req,
  	          verbose=.BetfairEnv$debug,
              writefunction = .BetfairEnv$textGatherer$update,
              headerfunction = .BetfairEnv$headerGatherer$update
             )
  
  httpHeader<-parseHTTPHeader(.BetfairEnv$headerGatherer$value())
  
  if (httpHeader[['status']]=="200") {
    ret <- fromJSON(.BetfairEnv$textGatherer$value())
    sessionToken<-ret[["token"]]
    
    if (.BetfairEnv$debug) {
      product<-ret[["product"]]
      status<-ret[["status"]]
      error<-ret[["error"]]
      message(paste0("Error:",error))
      message(paste0("Status:",status))
      message(paste0("AppKey:",product))
      message(paste0("SessionToken:",sessionToken))
    }
    
    .BetfairEnv$appKey<-appKey
    .BetfairEnv$sessionToken<-sessionToken
  
    return(ret)
  }
  else {
    stop(paste0("HTTP error: ",
                httpHeader[['status']]," ",
                httpHeader[['statusMessage']]," ",
                httpHeader[['Date']]))
  }
}

################################################################################
#' @title login
#' @description Login with certificate
#' @usage login(appKey,username,password,sslcert)
#' @param appKey product or application key
#' @param username betfair username
#' @param password betfair password
#' @param sslcert
#' @return  list(status,token,product,status,error)
################################################################################
ssologin<-function(appKey,username,password,sslcert=.BetfairEnv$sslcert) {
  headers<-c('X-Application'=appKey, 'Accept'='application/json', 'Content-Type'='application/x-www-form-urlencoded')
  url<-'https://identitysso.betfair.com/api/certlogin'
  req<-paste0('username=',username,'&password=',password)
  .BetfairEnv$textGatherer$reset()
  .BetfairEnv$headerGatherer$reset()
  
  if (.BetfairEnv$debug) message(paste0('Request:',req))
  
  curlPerform(url=url,
  	  	      httpheader=headers,
  	  	      postfields=req,
  	  	      sslcert=sslcert,
  	  	      verbose=.BetfairEnv$debug,
  	  	      writefunction = .BetfairEnv$textGatherer$update,
  	  	      headerfunction = .BetfairEnv$headerGatherer$update
             )
  
  httpHeader<-parseHTTPHeader(.BetfairEnv$headerGatherer$value())
  if (httpHeader[['status']]=="200") {
    ret <- fromJSON(.BetfairEnv$textGatherer$value())
    sessionToken<-ret[['sessionToken']]
    
    if (.BetfairEnv$debug) {
      status<-ret[['loginStatus']]
      message(paste0('Status:',status))
      message(paste0('SessionToken:',sessionToken))
  
    }
    
    .BetfairEnv$appKey<-appKey
    .BetfairEnv$sessionToken<-sessionToken
    return(ret)
  }
  else {
    stop(paste0("HTTP error: ",
                httpHeader[['status']]," ",
                httpHeader[['statusMessage']]," ",
                httpHeader[['Date']]))
  }
}

################################################################################
#' @title logout
#' @description Logout, does not matter is sso or not same call covers
#' @usage logout(sessionToken)
#' @param sessionToken 
#' @return  list(status,token,product,error)
################################################################################
logout<-function(sessionToken=.BetfairEnv$sessionToken) {
  if (is.null(sessionToken)) {
	 stop("Session token is not set:")
  }
  headers<-c('X-Application'=.BetfairEnv$appKey, 'X-Authentication'=sessionToken, 'Accept'='application/json')
  url<-"https://identitysso.betfair.com/api/logout"
  
  .BetfairEnv$textGatherer$reset()
  .BetfairEnv$headerGatherer$reset()
 
  curlPerform(url=url,
  	          httpheader=headers,
  	          verbose=.BetfairEnv$debug,
              writefunction = .BetfairEnv$textGatherer$update,
              headerfunction = .BetfairEnv$headerGatherer$update)
  
  httpHeader<-parseHTTPHeader(.BetfairEnv$headerGatherer$value())
  
  if (httpHeader[['status']]=="200") {
    ret <- fromJSON(.BetfairEnv$textGatherer$value())
    sessionToken<-ret[["token"]]
    
    if (.BetfairEnv$debug) {
      product<-ret[["product"]]
      status<-ret[["status"]]
      error<-ret[["error"]]
      message(paste0("Error:",error))
      message(paste0("Status:",status))
    }
    
    if (exists('sessionToken',envir=.BetfairEnv,inherits = FALSE))
      rm("sessionToken",envir=.BetfairEnv)
    
    return(ret)
  }
  else {
    stop(paste0("HTTP error: ",
                httpHeader[['status']]," ",
                httpHeader[['statusMessage']]," ",
                httpHeader[['Date']]))
  }
}

# Send a keep alive if concerned with timeout condition
keepAlive<-function(sessionToken=.BetfairEnv$sessionToken) {
  if (is.null(sessionToken)) {
	 stop("Session token is not set:")
  }
  
  headers<-c('X-Application'=.BetfairEnv$appKey, 'X-Authentication'=sessionToken, 'Accept'='application/json')
  url<-"https://identitysso.betfair.com/api/keepAlive"
  
  .BetfairEnv$textGatherer$reset()
  .BetfairEnv$headerGatherer$reset()
  
  curlPerform(url=url,
  	          httpheader=headers,
  	          verbose=.BetfairEnv$debug,
              writefunction = .BetfairEnv$textGatherer$update,
              headerfunction = .BetfairEnv$headerGatherer$update)
  
  httpHeader<-parseHTTPHeader(.BetfairEnv$headerGatherer$value())
  
  if (httpHeader[['status']]=="200") {
    ret <- fromJSON(.BetfairEnv$textGatherer$value())
    
    if (.BetfairEnv$debug) {
      status<-ret[["status"]]
      error<-ret[["error"]]
      message(paste0("Error:",error))
      message(paste0("Status:",status))
    }
    
    return(ret)
  }
  else {
    stop(paste0("HTTP error: ",
                httpHeader[['status']]," ",
                httpHeader[['statusMessage']]," ",
                httpHeader[['Date']]))
  }
}

