################################################################################
#  Interface:   AccountAPING
#  Description: Account API-NG
#  Version:     1.0.0
#  Owner:       BDP
#  Date:        now()
#  Generated:   08-Oct-2014
################################################################################

################################################################################
#' @title SubscriptionStatus
#' @description SubscriptionStatus
#' @usage SubscriptionStatus(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     ALL
#'            Any subscription status
#'     }
#'     \item {     ACTIVATED
#'            Only activated subscriptions
#'     }
#'     \item {     UNACTIVATED
#'            Only unactivated subscriptions
#'     }
#'     \item {     CANCELLED
#'            Only cancelled subscriptions
#'     }
#'     \item {     EXPIRED
#'            Only expired subscriptions
#'     }
#'   }
#' }
################################################################################
SubscriptionStatusValidValues=c("ALL","ACTIVATED","UNACTIVATED","CANCELLED","EXPIRED")
SubscriptionStatus<-function(values) {
  validateSet(values,'SubscriptionStatus',SubscriptionStatusValidValues)
  class(values) <- append(class(values),"SubscriptionStatus")
  return(values)
}
SetOfSubscriptionStatus<-function(...) { SetOfV(list(...),'SubscriptionStatus',SubscriptionStatusValidValues) }
ListOfSubscriptionStatus<-function(...) { ListOfV(list(...),'SubscriptionStatus',SubscriptionStatusValidValues) }

################################################################################
#' @title Status
#' @description Status
#' @usage Status(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     SUCCESS
#'            Sucess status
#'     }
#'   }
#' }
################################################################################
StatusValidValues=c("SUCCESS")
Status<-function(values) {
  validateSet(values,'Status',StatusValidValues)
  class(values) <- append(class(values),"Status")
  return(values)
}
SetOfStatus<-function(...) { SetOfV(list(...),'Status',StatusValidValues) }
ListOfStatus<-function(...) { ListOfV(list(...),'Status',StatusValidValues) }

################################################################################
#' @title ItemClass
#' @description ItemClass
#' @usage ItemClass(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     UNKNOWN
#'            Statement item not mapped to a specific class. All values will be
#'            concatenated into a single key/value pair. The key will be
#'            'unknownStatementItem' and the value will be a comma separated string.
#'            
#'     }
#'   }
#' }
################################################################################
ItemClassValidValues=c("UNKNOWN")
ItemClass<-function(values) {
  validateSet(values,'ItemClass',ItemClassValidValues)
  class(values) <- append(class(values),"ItemClass")
  return(values)
}
SetOfItemClass<-function(...) { SetOfV(list(...),'ItemClass',ItemClassValidValues) }
ListOfItemClass<-function(...) { ListOfV(list(...),'ItemClass',ItemClassValidValues) }

################################################################################
#' @title Wallet
#' @description Wallet
#' @usage Wallet(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     UK
#'     }
#'     \item {     AUSTRALIAN
#'     }
#'   }
#' }
################################################################################
WalletValidValues=c("UK","AUSTRALIAN")
Wallet<-function(values) {
  validateSet(values,'Wallet',WalletValidValues)
  class(values) <- append(class(values),"Wallet")
  return(values)
}
SetOfWallet<-function(...) { SetOfV(list(...),'Wallet',WalletValidValues) }
ListOfWallet<-function(...) { ListOfV(list(...),'Wallet',WalletValidValues) }

################################################################################
#' @title IncludeItem
#' @description IncludeItem
#' @usage IncludeItem(values)
#' @param values Any of following valid values
#' @details {
#'   \itemize{
#'     \item {     ALL
#'     }
#'     \item {     EXCHANGE
#'     }
#'     \item {     POKER_ROOM
#'     }
#'     \item {     DEPOSITS_WITHDRAWALS
#'     }
#'   }
#' }
################################################################################
IncludeItemValidValues=c("ALL","EXCHANGE","POKER_ROOM","DEPOSITS_WITHDRAWALS")
IncludeItem<-function(values) {
  validateSet(values,'IncludeItem',IncludeItemValidValues)
  class(values) <- append(class(values),"IncludeItem")
  return(values)
}
SetOfIncludeItem<-function(...) { SetOfV(list(...),'IncludeItem',IncludeItemValidValues) }
ListOfIncludeItem<-function(...) { ListOfV(list(...),'IncludeItem',IncludeItemValidValues) }

################################################################################
#' @title  AccountStatementReport
#' @description A container representing search results.
#' @param accountStatement is mandatory of type ListOfStatementItem.
#'        The list of statement items returned by your request. 
#' @param moreAvailable is mandatory of type logical.
#'        Indicates whether there are further result items beyond this page. 
################################################################################
AccountStatementReport<-function(accountStatement,moreAvailable) {
  validateField(accountStatement,'ListOfStatementItem',TRUE,'accountStatement')
  validateField(moreAvailable,'logical',TRUE,'moreAvailable')

  ret=list(accountStatement=accountStatement,moreAvailable=moreAvailable)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"AccountStatementReport")
  ret
}

SetOfAccountStatementReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfAccountStatementReport')
  return(lv)
}

ListOfAccountStatementReport<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfAccountStatementReport')
  return(lv)
}

################################################################################
#' @title  StatementItem
#' @description Summary of a cleared order.
#' @param refId is optional of type character.
#'        An external reference, eg. equivalent to betId in the case of an
#'        exchange bet statement item. 
#' @param itemDate is mandatory of type dateTime.
#'        The date and time of the statement item, eg. equivalent to settledData
#'        for an exchange bet statement item. (in ISO-8601 format, not
#'        translated) 
#' @param amount is optional of type numeric.
#'        The amount of money the balance is adjusted by
#' @param balance is optional of type numeric.
#'        Account balance.
#' @param itemClass is optional of type ItemClass.
#'        Class of statement item. This value will determine which set of keys
#'        will be included in itemClassData 
#' @param itemClassData is optional of type map(string,string).
#'        Key value pairs describing the current statement item. The set of keys
#'        will be determined by the itemClass 
#' @param legacyData is optional of type StatementLegacyData.
#'        Set of fields originally returned from APIv6. Provided to facilitate
#'        migration from APIv6 to API-NG, and ultimately onto itemClass and
#'        itemClassData 
################################################################################
StatementItem<-function(refId=NULL,itemDate,amount=NULL,balance=NULL,itemClass=NULL,itemClassData=NULL,legacyData=NULL) {
  validateField(refId,'character',FALSE,'refId')
  validateDateTime(itemDate,'dateTime',TRUE,'itemDate')
  validateField(amount,'numeric',FALSE,'amount')
  validateField(balance,'numeric',FALSE,'balance')
  validateField(itemClass,'ItemClass',FALSE,'itemClass')
  validateField(itemClassData,'map(string,string)',FALSE,'itemClassData')
  validateField(legacyData,'StatementLegacyData',FALSE,'legacyData')

  ret=list(refId=refId,itemDate=itemDate,amount=amount,balance=balance,itemClass=itemClass,itemClassData=itemClassData,legacyData=legacyData)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"StatementItem")
  ret
}

SetOfStatementItem<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfStatementItem')
  return(lv)
}

ListOfStatementItem<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfStatementItem')
  return(lv)
}

################################################################################
#' @title  StatementLegacyData
#' @description Summary of a cleared order.
#' @param avgPrice is optional of type numeric.
#'        
#' @param betSize is optional of type numeric.
#'        
#' @param betType is optional of type character.
#'        
#' @param betCategoryType is optional of type character.
#'        
#' @param commissionRate is optional of type character.
#'        
#' @param eventId is optional of type integer.
#'        
#' @param eventTypeId is optional of type integer.
#'        
#' @param fullMarketName is optional of type character.
#'        
#' @param grossBetAmount is optional of type numeric.
#'        
#' @param marketName is optional of type character.
#'        
#' @param marketType is optional of type character.
#'        
#' @param placedDate is optional of type dateTime.
#'        
#' @param selectionId is optional of type integer.
#'        
#' @param selectionName is optional of type character.
#'        
#' @param startDate is optional of type dateTime.
#'        
#' @param transactionType is optional of type character.
#'        
#' @param transactionId is optional of type integer.
#'        
#' @param winLose is optional of type character.
#'        
################################################################################
StatementLegacyData<-function(avgPrice=NULL,betSize=NULL,betType=NULL,betCategoryType=NULL,commissionRate=NULL,eventId=NULL,eventTypeId=NULL,fullMarketName=NULL,grossBetAmount=NULL,marketName=NULL,marketType=NULL,placedDate=NULL,selectionId=NULL,selectionName=NULL,startDate=NULL,transactionType=NULL,transactionId=NULL,winLose=NULL) {
  validateField(avgPrice,'numeric',FALSE,'avgPrice')
  validateField(betSize,'numeric',FALSE,'betSize')
  validateField(betType,'character',FALSE,'betType')
  validateField(betCategoryType,'character',FALSE,'betCategoryType')
  validateField(commissionRate,'character',FALSE,'commissionRate')
  validateField(eventId,'integer',FALSE,'eventId')
  validateField(eventTypeId,'integer',FALSE,'eventTypeId')
  validateField(fullMarketName,'character',FALSE,'fullMarketName')
  validateField(grossBetAmount,'numeric',FALSE,'grossBetAmount')
  validateField(marketName,'character',FALSE,'marketName')
  validateField(marketType,'character',FALSE,'marketType')
  validateDateTime(placedDate,'dateTime',FALSE,'placedDate')
  validateField(selectionId,'integer',FALSE,'selectionId')
  validateField(selectionName,'character',FALSE,'selectionName')
  validateDateTime(startDate,'dateTime',FALSE,'startDate')
  validateField(transactionType,'character',FALSE,'transactionType')
  validateField(transactionId,'integer',FALSE,'transactionId')
  validateField(winLose,'character',FALSE,'winLose')

  ret=list(avgPrice=avgPrice,betSize=betSize,betType=betType,betCategoryType=betCategoryType,commissionRate=commissionRate,eventId=eventId,eventTypeId=eventTypeId,fullMarketName=fullMarketName,grossBetAmount=grossBetAmount,marketName=marketName,marketType=marketType,placedDate=placedDate,selectionId=selectionId,selectionName=selectionName,startDate=startDate,transactionType=transactionType,transactionId=transactionId,winLose=winLose)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"StatementLegacyData")
  ret
}

SetOfStatementLegacyData<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfStatementLegacyData')
  return(lv)
}

ListOfStatementLegacyData<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfStatementLegacyData')
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
#' @title  ApplicationSubscription
#' @description Application subscription details 
#' @param subscriptionToken is mandatory of type character.
#'        Application key identifier
#' @param expiryDateTime is optional of type dateTime.
#'        Subscription Expiry date
#' @param expiredDateTime is optional of type dateTime.
#'        Subscription Expired date
#' @param createdDateTime is optional of type dateTime.
#'        Subscription Create date
#' @param activationDateTime is optional of type dateTime.
#'        Subscription Activation date
#' @param cancellationDateTime is optional of type dateTime.
#'        Subscription Cancelled date
#' @param subscriptionStatus is optional of type character.
#'        Subscription status
#' @param clientReference is optional of type character.
#'        Client reference
#' @param vendorClientId is optional of type character.
#'        Vendor client Id
################################################################################
ApplicationSubscription<-function(subscriptionToken,expiryDateTime=NULL,expiredDateTime=NULL,createdDateTime=NULL,activationDateTime=NULL,cancellationDateTime=NULL,subscriptionStatus=NULL,clientReference=NULL,vendorClientId=NULL) {
  validateField(subscriptionToken,'character',TRUE,'subscriptionToken')
  validateDateTime(expiryDateTime,'dateTime',FALSE,'expiryDateTime')
  validateDateTime(expiredDateTime,'dateTime',FALSE,'expiredDateTime')
  validateDateTime(createdDateTime,'dateTime',FALSE,'createdDateTime')
  validateDateTime(activationDateTime,'dateTime',FALSE,'activationDateTime')
  validateDateTime(cancellationDateTime,'dateTime',FALSE,'cancellationDateTime')
  validateField(subscriptionStatus,'character',FALSE,'subscriptionStatus')
  validateField(clientReference,'character',FALSE,'clientReference')
  validateField(vendorClientId,'character',FALSE,'vendorClientId')

  ret=list(subscriptionToken=subscriptionToken,expiryDateTime=expiryDateTime,expiredDateTime=expiredDateTime,createdDateTime=createdDateTime,activationDateTime=activationDateTime,cancellationDateTime=cancellationDateTime,subscriptionStatus=subscriptionStatus,clientReference=clientReference,vendorClientId=vendorClientId)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"ApplicationSubscription")
  ret
}

SetOfApplicationSubscription<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfApplicationSubscription')
  return(lv)
}

ListOfApplicationSubscription<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfApplicationSubscription')
  return(lv)
}

################################################################################
#' @title  SubscriptionHistory
#' @description Application subscription history details 
#' @param subscriptionToken is mandatory of type character.
#'        Application key identifier
#' @param expiryDateTime is optional of type dateTime.
#'        Subscription Expiry date
#' @param expiredDateTime is optional of type dateTime.
#'        Subscription Expired date
#' @param createdDateTime is optional of type dateTime.
#'        Subscription Create date
#' @param activationDateTime is optional of type dateTime.
#'        Subscription Activation date
#' @param cancellationDateTime is optional of type dateTime.
#'        Subscription Cancelled date
#' @param subscriptionStatus is optional of type character.
#'        Subscription status
#' @param clientReference is optional of type character.
#'        Client reference
################################################################################
SubscriptionHistory<-function(subscriptionToken,expiryDateTime=NULL,expiredDateTime=NULL,createdDateTime=NULL,activationDateTime=NULL,cancellationDateTime=NULL,subscriptionStatus=NULL,clientReference=NULL) {
  validateField(subscriptionToken,'character',TRUE,'subscriptionToken')
  validateDateTime(expiryDateTime,'dateTime',FALSE,'expiryDateTime')
  validateDateTime(expiredDateTime,'dateTime',FALSE,'expiredDateTime')
  validateDateTime(createdDateTime,'dateTime',FALSE,'createdDateTime')
  validateDateTime(activationDateTime,'dateTime',FALSE,'activationDateTime')
  validateDateTime(cancellationDateTime,'dateTime',FALSE,'cancellationDateTime')
  validateField(subscriptionStatus,'character',FALSE,'subscriptionStatus')
  validateField(clientReference,'character',FALSE,'clientReference')

  ret=list(subscriptionToken=subscriptionToken,expiryDateTime=expiryDateTime,expiredDateTime=expiredDateTime,createdDateTime=createdDateTime,activationDateTime=activationDateTime,cancellationDateTime=cancellationDateTime,subscriptionStatus=subscriptionStatus,clientReference=clientReference)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"SubscriptionHistory")
  ret
}

SetOfSubscriptionHistory<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfSubscriptionHistory')
  return(lv)
}

ListOfSubscriptionHistory<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfSubscriptionHistory')
  return(lv)
}

################################################################################
#' @title  AccountSubscription
#' @description Application subscription details 
#' @param subscriptionTokens is mandatory of type ListOfSubscriptionTokenInfo.
#'        Lis t of subscription token details
#' @param applicationName is optional of type character.
#'        Application name
#' @param applicationVersionId is optional of type character.
#'        Application version Id
################################################################################
AccountSubscription<-function(subscriptionTokens,applicationName=NULL,applicationVersionId=NULL) {
  validateField(subscriptionTokens,'ListOfSubscriptionTokenInfo',TRUE,'subscriptionTokens')
  validateField(applicationName,'character',FALSE,'applicationName')
  validateField(applicationVersionId,'character',FALSE,'applicationVersionId')

  ret=list(subscriptionTokens=subscriptionTokens,applicationName=applicationName,applicationVersionId=applicationVersionId)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"AccountSubscription")
  ret
}

SetOfAccountSubscription<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfAccountSubscription')
  return(lv)
}

ListOfAccountSubscription<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfAccountSubscription')
  return(lv)
}

################################################################################
#' @title  SubscriptionTokenInfo
#' @description Subscription token information 
#' @param subscriptionToken is mandatory of type character.
#'        Subscription token
#' @param activatedDateTime is optional of type dateTime.
#'        Subscription Activated date
#' @param expiryDateTime is optional of type dateTime.
#'        Subscription Expiry date
#' @param expiredDateTime is optional of type dateTime.
#'        Subscription Expired date
#' @param cancellationDateTime is optional of type dateTime.
#'        Subscription Cancelled date
#' @param subscriptionStatus is optional of type character.
#'        Subscription status
################################################################################
SubscriptionTokenInfo<-function(subscriptionToken,activatedDateTime=NULL,expiryDateTime=NULL,expiredDateTime=NULL,cancellationDateTime=NULL,subscriptionStatus=NULL) {
  validateField(subscriptionToken,'character',TRUE,'subscriptionToken')
  validateDateTime(activatedDateTime,'dateTime',FALSE,'activatedDateTime')
  validateDateTime(expiryDateTime,'dateTime',FALSE,'expiryDateTime')
  validateDateTime(expiredDateTime,'dateTime',FALSE,'expiredDateTime')
  validateDateTime(cancellationDateTime,'dateTime',FALSE,'cancellationDateTime')
  validateField(subscriptionStatus,'character',FALSE,'subscriptionStatus')

  ret=list(subscriptionToken=subscriptionToken,activatedDateTime=activatedDateTime,expiryDateTime=expiryDateTime,expiredDateTime=expiredDateTime,cancellationDateTime=cancellationDateTime,subscriptionStatus=subscriptionStatus)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"SubscriptionTokenInfo")
  ret
}

SetOfSubscriptionTokenInfo<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfSubscriptionTokenInfo')
  return(lv)
}

ListOfSubscriptionTokenInfo<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfSubscriptionTokenInfo')
  return(lv)
}

################################################################################
#' @title  DeveloperApp
#' @description Describes developer/vendor specific application 
#' @param appName is mandatory of type character.
#'        The unique name of the application 
#' @param appId is mandatory of type integer.
#'        A unique id of this application 
#' @param appVersions is mandatory of type ListOfDeveloperAppVersion.
#'        The application versions (including application keys) 
################################################################################
DeveloperApp<-function(appName,appId,appVersions) {
  validateField(appName,'character',TRUE,'appName')
  validateField(appId,'integer',TRUE,'appId')
  validateField(appVersions,'ListOfDeveloperAppVersion',TRUE,'appVersions')

  ret=list(appName=appName,appId=appId,appVersions=appVersions)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"DeveloperApp")
  ret
}

SetOfDeveloperApp<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfDeveloperApp')
  return(lv)
}

ListOfDeveloperApp<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfDeveloperApp')
  return(lv)
}

################################################################################
#' @title  DeveloperAppVersion
#' @description Describes a version of an external application 
#' @param owner is mandatory of type character.
#'        The sportex user who owns the specific version of the application 
#' @param versionId is mandatory of type integer.
#'        The unique Id of the application version 
#' @param version is mandatory of type character.
#'        The version identifier string such as 1.0, 2.0. Unique for a given
#'        application. 
#' @param applicationKey is mandatory of type character.
#'        The unqiue application key associated with this application version 
#' @param delayData is optional of type logical.
#'        Indicates whether the data exposed by platform services as seen by
#'        this application key is delayed or realtime. 
#' @param subscriptionRequired is mandatory of type logical.
#'        Indicates whether the application version needs explicit subscription 
#' @param ownerManaged is mandatory of type logical.
#'        Indicates whether the application version needs explicit management by
#'        producers. A value of false indicates, this is a version meant for
#'        developer use. 
#' @param active is mandatory of type logical.
#'        Indicates whether the application version is currently active 
################################################################################
DeveloperAppVersion<-function(owner,versionId,version,applicationKey,delayData=NULL,subscriptionRequired,ownerManaged,active) {
  validateField(owner,'character',TRUE,'owner')
  validateField(versionId,'integer',TRUE,'versionId')
  validateField(version,'character',TRUE,'version')
  validateField(applicationKey,'character',TRUE,'applicationKey')
  validateField(delayData,'logical',FALSE,'delayData')
  validateField(subscriptionRequired,'logical',TRUE,'subscriptionRequired')
  validateField(ownerManaged,'logical',TRUE,'ownerManaged')
  validateField(active,'logical',TRUE,'active')

  ret=list(owner=owner,versionId=versionId,version=version,applicationKey=applicationKey,delayData=delayData,subscriptionRequired=subscriptionRequired,ownerManaged=ownerManaged,active=active)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"DeveloperAppVersion")
  ret
}

SetOfDeveloperAppVersion<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfDeveloperAppVersion')
  return(lv)
}

ListOfDeveloperAppVersion<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfDeveloperAppVersion')
  return(lv)
}

################################################################################
#' @title  AccountFundsResponse
#' @description Response for retrieving available to bet. 
#' @param availableToBetBalance is optional of type numeric.
#'        Amount available to bet. 
#' @param exposure is optional of type numeric.
#'        Current exposure. 
#' @param retainedCommission is optional of type numeric.
#'        Sum of retained commission. 
#' @param exposureLimit is optional of type numeric.
#'        Exposure limit. 
#' @param discountRate is optional of type numeric.
#'        User Discount Rate. 
#' @param pointsBalance is optional of type integer.
#'        The Betfair points balance. 
################################################################################
AccountFundsResponse<-function(availableToBetBalance=NULL,exposure=NULL,retainedCommission=NULL,exposureLimit=NULL,discountRate=NULL,pointsBalance=NULL) {
  validateField(availableToBetBalance,'numeric',FALSE,'availableToBetBalance')
  validateField(exposure,'numeric',FALSE,'exposure')
  validateField(retainedCommission,'numeric',FALSE,'retainedCommission')
  validateField(exposureLimit,'numeric',FALSE,'exposureLimit')
  validateField(discountRate,'numeric',FALSE,'discountRate')
  validateField(pointsBalance,'integer',FALSE,'pointsBalance')

  ret=list(availableToBetBalance=availableToBetBalance,exposure=exposure,retainedCommission=retainedCommission,exposureLimit=exposureLimit,discountRate=discountRate,pointsBalance=pointsBalance)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"AccountFundsResponse")
  ret
}

SetOfAccountFundsResponse<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfAccountFundsResponse')
  return(lv)
}

ListOfAccountFundsResponse<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfAccountFundsResponse')
  return(lv)
}

################################################################################
#' @title  AccountDetailsResponse
#' @description Response for Account details. 
#' @param currencyCode is optional of type character.
#'        Default user currency Code. 
#' @param firstName is optional of type character.
#'        First Name. 
#' @param lastName is optional of type character.
#'        Last Name. 
#' @param localeCode is optional of type character.
#'        Locale Code. 
#' @param region is optional of type character.
#'        Region. 
#' @param timezone is optional of type character.
#'        User Time Zone. 
#' @param discountRate is optional of type numeric.
#'        User Discount Rate. 
#' @param pointsBalance is optional of type integer.
#'        The Betfair points balance. 
################################################################################
AccountDetailsResponse<-function(currencyCode=NULL,firstName=NULL,lastName=NULL,localeCode=NULL,region=NULL,timezone=NULL,discountRate=NULL,pointsBalance=NULL) {
  validateField(currencyCode,'character',FALSE,'currencyCode')
  validateField(firstName,'character',FALSE,'firstName')
  validateField(lastName,'character',FALSE,'lastName')
  validateField(localeCode,'character',FALSE,'localeCode')
  validateField(region,'character',FALSE,'region')
  validateField(timezone,'character',FALSE,'timezone')
  validateField(discountRate,'numeric',FALSE,'discountRate')
  validateField(pointsBalance,'integer',FALSE,'pointsBalance')

  ret=list(currencyCode=currencyCode,firstName=firstName,lastName=lastName,localeCode=localeCode,region=region,timezone=timezone,discountRate=discountRate,pointsBalance=pointsBalance)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"AccountDetailsResponse")
  ret
}

SetOfAccountDetailsResponse<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfAccountDetailsResponse')
  return(lv)
}

ListOfAccountDetailsResponse<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfAccountDetailsResponse')
  return(lv)
}

################################################################################
#' @title  CurrencyRate
#' @description Currency rate 
#' @param currencyCode is optional of type character.
#'        Three letter ISO 4217 code 
#' @param rate is optional of type numeric.
#'        Exchange rate for the currency specified in the request 
################################################################################
CurrencyRate<-function(currencyCode=NULL,rate=NULL) {
  validateField(currencyCode,'character',FALSE,'currencyCode')
  validateField(rate,'numeric',FALSE,'rate')

  ret=list(currencyCode=currencyCode,rate=rate)
  ret[sapply(ret, is.null)] <- NULL
  class(ret) <- append(class(ret),"CurrencyRate")
  ret
}

SetOfCurrencyRate<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'SetOfCurrencyRate')
  return(lv)
}

ListOfCurrencyRate<-function(...) {
  lv<-list(...)
  class(lv) <- append(class(lv),'ListOfCurrencyRate')
  return(lv)
}

################################################################################
#' @title createDeveloperAppKeys
#' @description Create 2 application keys for given user; one active and the other delayed 
#' @param   appName is mandatory of type character.
#'          A Display name for the application. 
#' @return  A map of application keys, one marked ACTIVE, and the other DELAYED 
################################################################################
json.createDeveloperAppKeys<-function(appName=string() ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
    params = list(appName=appName )
  run.operation('createDeveloperAppKeys',params,exchange,appKey,sessionToken,api='account')
}

r.createDeveloperAppKeys<-function(appName=string() ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.createDeveloperAppKeys(appName=appName , exchange=exchange,
 appKey=appKey, sessionToken=sessionToken)
  toR(ret)
}

################################################################################
#' @title getDeveloperAppKeys
#' @description Get all application keys owned by the given developer/vendor 
#' @return  A list of application keys owned by the given developer/vendor 
################################################################################
json.getDeveloperAppKeys<-function(exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
    params = list()
  run.operation('getDeveloperAppKeys',params,exchange,appKey,sessionToken,api='account')
}

r.getDeveloperAppKeys<-function(exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.getDeveloperAppKeys(exchange=exchange, appKey=appKey,
 sessionToken=sessionToken)
  toR(ret)
}

################################################################################
#' @title getAccountFunds
#' @description Get available to bet amount. 
#' @return  Response for retrieving available to bet. 
################################################################################
json.getAccountFunds<-function(exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
    params = list()
  run.operation('getAccountFunds',params,exchange,appKey,sessionToken,api='account')
}

r.getAccountFunds<-function(exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.getAccountFunds(exchange=exchange, appKey=appKey,
 sessionToken=sessionToken)
  toR(ret)
}

################################################################################
#' @title getAccountDetails
#' @description Get Account details. 
#' @return  Response for retrieving account details. 
################################################################################
json.getAccountDetails<-function(exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
    params = list()
  run.operation('getAccountDetails',params,exchange,appKey,sessionToken,api='account')
}

r.getAccountDetails<-function(exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.getAccountDetails(exchange=exchange, appKey=appKey,
 sessionToken=sessionToken)
  toR(ret)
}

################################################################################
#' @title getVendorClientId
#' @description Get vendor client id for customer account. 
#' @return  Vendor client id. 
################################################################################
json.getVendorClientId<-function(exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
    params = list()
  run.operation('getVendorClientId',params,exchange,appKey,sessionToken,api='account')
}

r.getVendorClientId<-function(exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.getVendorClientId(exchange=exchange, appKey=appKey,
 sessionToken=sessionToken)
  toR(ret)
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
json.getApplicationSubscriptionToken<-function(subscriptionLength=NULL,
  clientReference=NULL , exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  params = list(subscriptionLength=subscriptionLength,
  clientReference=clientReference )
  run.operation('getApplicationSubscriptionToken',params,exchange,appKey,sessionToken,api='account')
}

r.getApplicationSubscriptionToken<-function(subscriptionLength=NULL,
  clientReference=NULL , exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.getApplicationSubscriptionToken(subscriptionLength=subscriptionLength,
 clientReference=clientReference , exchange=exchange, appKey=appKey,
 sessionToken=sessionToken)
  toR(ret)
}

################################################################################
#' @title activateApplicationSubscription
#' @description Activate the subscription token for the customer 
#' @param   subscriptionToken is mandatory of type character.
#'          Subscription token for activation 
################################################################################
json.activateApplicationSubscription<-function(subscriptionToken=string() ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
    params = list(subscriptionToken=subscriptionToken )
  run.operation('activateApplicationSubscription',params,exchange,appKey,sessionToken,api='account')
}

r.activateApplicationSubscription<-function(subscriptionToken=string() ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.activateApplicationSubscription(subscriptionToken=subscriptionToken ,
 exchange=exchange, appKey=appKey, sessionToken=sessionToken)
  toR(ret)
}

################################################################################
#' @title cancelApplicationSubscription
#' @description Cancel application subscription 
#' @param   subscriptionToken is mandatory of type character.
#'          Subscription token to cancel 
################################################################################
json.cancelApplicationSubscription<-function(subscriptionToken=string() ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
    params = list(subscriptionToken=subscriptionToken )
  run.operation('cancelApplicationSubscription',params,exchange,appKey,sessionToken,api='account')
}

r.cancelApplicationSubscription<-function(subscriptionToken=string() ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.cancelApplicationSubscription(subscriptionToken=subscriptionToken ,
 exchange=exchange, appKey=appKey, sessionToken=sessionToken)
  toR(ret)
}

################################################################################
#' @title listApplicationSubscriptionTokens
#' @description List of subscription tokens for an application 
#' @param   subscriptionStatus is optional of type SubscriptionStatus.
#'          Optionally filter response by Subscription status of the token 
#' @return  List of subscription tokens for an application 
################################################################################
json.listApplicationSubscriptionTokens<-function(subscriptionStatus=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
    params = list(subscriptionStatus=subscriptionStatus )
  run.operation('listApplicationSubscriptionTokens',params,exchange,appKey,sessionToken,api='account')
}

r.listApplicationSubscriptionTokens<-function(subscriptionStatus=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.listApplicationSubscriptionTokens(subscriptionStatus=subscriptionStatus
 , exchange=exchange, appKey=appKey, sessionToken=sessionToken)
  toR(ret)
}

################################################################################
#' @title listAccountSubscriptionTokens
#' @description List of subscription tokens associated with the account 
#' @return  List of subscription tokens associated with the account 
################################################################################
json.listAccountSubscriptionTokens<-function(exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
    params = list()
  run.operation('listAccountSubscriptionTokens',params,exchange,appKey,sessionToken,api='account')
}

r.listAccountSubscriptionTokens<-function(exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.listAccountSubscriptionTokens(exchange=exchange, appKey=appKey,
 sessionToken=sessionToken)
  toR(ret)
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
################################################################################
json.getApplicationSubscriptionHistory<-function(vendorClientId=string(),
  applicationKey=NULL , exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
    params = list(vendorClientId=vendorClientId, applicationKey=applicationKey )
  run.operation('getApplicationSubscriptionHistory',params,exchange,appKey,sessionToken,api='account')
}

r.getApplicationSubscriptionHistory<-function(vendorClientId=string(),
  applicationKey=NULL , exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.getApplicationSubscriptionHistory(vendorClientId=vendorClientId,
 applicationKey=applicationKey , exchange=exchange, appKey=appKey,
 sessionToken=sessionToken)
  toR(ret)
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
################################################################################
json.getAccountStatement<-function(locale=NULL, fromRecord=NULL,
  recordCount=NULL, itemDateRange=NULL, includeItem=NULL, wallet=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  params = list(locale=locale, fromRecord=fromRecord, recordCount=recordCount,
  itemDateRange=itemDateRange, includeItem=includeItem, wallet=wallet )
  run.operation('getAccountStatement',params,exchange,appKey,sessionToken,api='account')
}

r.getAccountStatement<-function(locale=NULL, fromRecord=NULL, recordCount=NULL,
  itemDateRange=NULL, includeItem=NULL, wallet=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.getAccountStatement(locale=locale, fromRecord=fromRecord,
 recordCount=recordCount, itemDateRange=itemDateRange, includeItem=includeItem,
 wallet=wallet , exchange=exchange, appKey=appKey, sessionToken=sessionToken)
  toR(ret)
}

################################################################################
#' @title listCurrencyRates
#' @description Returns a list of currency rates based on given currency 
#' @param   fromCurrency is optional of type character.
#'          The currency from which the rates are computed. GBP is used if no
#'          value is passed
#' @return  List of currency rates 
################################################################################
json.listCurrencyRates<-function(fromCurrency=NULL ,
  exchange=.BetfairEnv$exchange, appKey=.BetfairEnv$appKey,
  sessionToken=.BetfairEnv$sessionToken) {
    params = list(fromCurrency=fromCurrency )
  run.operation('listCurrencyRates',params,exchange,appKey,sessionToken,api='account')
}

r.listCurrencyRates<-function(fromCurrency=NULL , exchange=.BetfairEnv$exchange,
  appKey=.BetfairEnv$appKey, sessionToken=.BetfairEnv$sessionToken) {
  ret<-json.listCurrencyRates(fromCurrency=fromCurrency , exchange=exchange,
 appKey=appKey, sessionToken=sessionToken)
  toR(ret)
}

