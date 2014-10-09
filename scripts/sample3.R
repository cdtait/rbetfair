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

# Login with sso
ssologin(appKey,username,password)
# Test the heartbeat, cancels any exiting or no effect
heartbeat(preferredTimeoutSeconds=0)
# Get the devleoper app keys in components and join them by appId
apps<-getDeveloperAppKeys()
(appsummary<-merge(apps$apps,apps$keys,by.x='appId',by.y='version.appId'))
# Show currency rates default to GB
(currencyRates<-listCurrencyRates())
# Show account funds
(funds<-getAccountFunds())
# Show the accoount
(account<-getAccountDetails())
# Get Vendor Client Id
(vendorClientId<-getVendorClientId())
(subhistory<-getApplicationSubscriptionHistory(vendorClientId))
# logout
logout()

