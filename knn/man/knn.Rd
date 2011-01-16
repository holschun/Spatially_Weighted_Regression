\name{knn}
\alias{knn}
\title{
GCV in bandwidth selection
}
\description{
functions to run our KNN simulation to evaluate the GCV score as a bandwidth selection criteria.
Our data generating process is Y = B1*X1 + B2*X2 + error, where B1/B2 can be spatially varying. 
To use this function, you should specify a vector of m1 (see below for what it is), a vector of m2 (with the two vectors having equal length), a vector of the standard deviation of the error term, and you may also specify how B1 and B2 vary geographically.
One example would be:

m1 = seq(0.1,1,0.1)

m2 = seq(0.1,1,0.1)

e = seq(0.5,0.8,0.1)

dgp1 = "m1*latt+1-5*m1" (latt means latitude)

dgp2 = "5*m2+1-m2*long" (long means longitude)

result = knn(m1,m2,e,dgp1,dgp2)

Here, B1 would be equal to m1*latt+1-5*m1, and similarly for B2. Hence dgp1 and dgp2 are formulas for the trueB's

Note that the dgp1 and dgp2 must be put in quotations.
}
\usage{
knn(m1, m2, e, dgp1, dgp2, n, loops)
}
\arguments{
  \item{m1}{
	parameter used in the formula of dgp1
}
  \item{m2}{
	parameter used in the formula of dgp2
}
  \item{e}{
	standard deviation of the error term (default: e=0)
}
  \item{dgp1}{
	formula of true B1 (default: dgp1 = "1")
}
  \item{dgp2}{
	formula of true B2 (default: dgp1 = "2")
}
  \item{n}{
	number of observations in each simulation; default is 20 (to save runtime)
}
  \item{loops}{
	number of iterations in each simulation; default is 5 (to save runtime)
}
}
\details{
	output structure:
	
	result[[i]][[j]] is equal to the output run by using the following specification:
	result_alternative = knn(m1[i],m2[i],e[j],dgp1,dgp2);
	
	result_alternative has fix sub fields:
	betahats, stdhats, gcv, score, minK, runtime. The names are pretty self-explanatory; to access them, use
	
	result_alternative$stdhats     etc.
}
\value{
	See output structures.
}
\references{
	N/A.
}
\author{
	Ernest Liu, Daisy Sun, Aaron Swoboda.
}
\note{
	To be continued...
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
m1 = seq(0.1,0.2,0.1)
m2 = seq(0.3,0.4,0.1)
e = seq(0.5,0.6,0.1)
dgp1 = "m1*latt+1-5*m1"
dgp2 = "5*m2+1-m2*long"
result = knn(m1,m2,e,dgp1,dgp2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
