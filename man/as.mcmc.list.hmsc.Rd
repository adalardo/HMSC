% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/as.mcmc.list.hmsc.R
\name{as.mcmc.list.hmsc}
\alias{as.mcmc.list.hmsc}
\title{Convert lists of hmsc objects to \code{\link{mcmc.list}} object}
\usage{
\method{as.mcmc}{list.hmsc}(x, parameters = "paramX", burning = FALSE, ...)
}
\arguments{
\item{x}{A list where each level contains an object of the class \code{hmsc}.}

\item{parameters}{A character string defining the parameters for which the \code{\link{mcmc.list}} needs to be constructed.}

\item{burning}{Logical. Whether the burning iterations should be include (\code{TRUE}) or not (\code{FALSE}).}

\item{\dots}{Additional arguments passed to \code{\link[coda]{mcmc.list}}.}
}
\value{
An object of class \code{\link{mcmc}}.
}
\description{
Use the Markov Chain Monte Carlo results obtained from multiple \code{\link{hmsc}} and convert them to an \code{\link{mcmc.list}} object.
}
\details{
Since the algorithm used adapts the number of latent variables to use, the \code{\link{mcmc}} object associated to \code{paramLatent} only includes information associated to the latent variables that are available for all iterations.
}
\examples{

#================
### Generate data
#================
desc <- cbind(1, scale(1:50), scale(1:50)^2)
nspecies <- 20
commDesc <- communitySimul(X = desc, nsp = nspecies)

#=============
### Formatting
#=============
### Format data
formdata <- as.HMSCdata(Y = commDesc$data$Y, X = desc, interceptX = FALSE)

#==============
### Build model
#==============

model <- vector("list",length=5)

for(i in 1:length(model)){
	model[[i]] <- hmsc(formdata, niter = 200, nburn = 100, thin = 1, verbose = FALSE)
}
paramXmcmc <- as.mcmc.list(model, parameters = "paramX")

}
\seealso{
\code{\link{mcmc.list}}, \code{\link{hmsc}}
}
\author{
F. Guillaume Blanchet
}
\keyword{IO}
