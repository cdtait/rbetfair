\name{toR}
\alias{toR}

\title{
Converts JSON to R
}
\description{
Converts the Betfair JSON return format to an R form.
Extracts the result and any error variables seperately and checks any API exceptions and raises an R exception \code{\link{APINGException}}
}
\usage{
toR(retjson)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{retjson}{ Result from the call to betfair in json format to be checked and converted to R
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
The R structure based on the JSON parameter structure 
}
\references{
\itemize{
   \cite{Betfair API-NG \url{https://api.developer.betfair.com/}}
 }
}
\author{
Craig Tait
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{rjson}}
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x) 
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }

