\name{knn-gcv}
\alias{knn-gcv}
\alias{knn-gcv}
\docType{package}
\title{
GCV in bandwidth selection - package
}
\description{
functions to run our KNN simulation to evaluate the GCV score as a bandwidth selection criteria.

}
\details{
\tabular{ll}{
Package: \tab knn\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-01-12\cr
License: \tab What license is it under?\cr
LazyLoad: \tab yes\cr
}
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
\author{
Ernest Liu, Daisy Sun, Aaron Swoboda.

Maintainer: <sund@carleton.edu>

}
\references{
~~ Literature or other references for background information ~~
}
\keyword{ knn-gcv }
\seealso{
}
\examples{
}
