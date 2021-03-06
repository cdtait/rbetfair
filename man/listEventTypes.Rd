% Generated by roxygen2 (4.0.2): do not edit by hand
\name{listEventTypes}
\alias{listEventTypes}
\title{listEventTypes}
\usage{
listEventTypes(filter = MarketFilter(), locale = NULL,
  exchange = .BetfairEnv$exchange, appKey = .BetfairEnv$appKey,
  sessionToken = .BetfairEnv$sessionToken)
}
\arguments{
\item{filter}{is mandatory of type MarketFilter.
The filter to select desired markets. All markets that match the
criteria in the filter are selected.}

\item{locale}{is optional of type character.
The language used for the response. If not specified, the default is
returned.}
}
\value{
output data as data.frame
}
\description{
Returns a list of Event Types (i.e. Sports) associated with the markets
selected by the MarketFilter.
}
\examples{
# Get the horse racing event types ids
(eventTypes<-listEventTypes(filter=list(textQuery="Horse Racing")))
}

