% Generated by roxygen2 (4.0.2): do not edit by hand
\name{json.listCompetitions}
\alias{json.listCompetitions}
\title{listCompetitions}
\usage{
json.listCompetitions(filter = MarketFilter(), locale = NULL,
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
output data
}
\description{
Returns a list of Competitions (i.e., World Cup 2013) associated with the
markets selected by the MarketFilter. Currently only Football markets have an
associated competition.
}

