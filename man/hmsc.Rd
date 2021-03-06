% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hmsc.R
\name{hmsc}
\alias{hmsc}
\title{Hierarchical modelling of communities}
\usage{
hmsc(data, param = NULL, priors = NULL, family = c("probit", "gaussian",
  "poisson", "overPoisson"), niter = 2000, nburn = 1000, thin = 1,
  verbose = TRUE)
}
\arguments{
\item{data}{An object of the class \code{HMSCdata}.}

\item{param}{An object of the class \code{HMSCparam} to use as starting parameters for model estimation. If \code{param} is \code{NULL}, the function will generate a set of randomly sampled value as starting parameters.}

\item{priors}{An object of the class \code{HMSCprior}. If \code{prior} is \code{NULL}, flat prior will be use.}

\item{family}{A character string defining the type of modelling approach to use (See details).}

\item{niter}{A positive integer defining the total number of iterations to be carried out in the analysis. Default is 2000.}

\item{nburn}{A positive integer defining the number of iterations to be used in the burning (first) phase of the algorithm. The burning iterations are a fraction of \code{niter}. Default is 1000.}

\item{thin}{A positive integer defining thinning. Default is 1 (see details).}

\item{verbose}{Logical or numeric. If \code{TRUE}, the number of iterations are printed on the screen four times. If \code{FALSE}, nothing is printed on the screen. If a positive integer is given, the number of iterations is printed on the screen every time a multiple of the given value is an integer.}
}
\value{
The output of this function is an object of class \code{hmsc}, which has the following structure. The output is always divided in a \code{burning} and an \code{estimation} part which contain the following sub-parts:
\itemize{
  \item{\code{data}}{ An object of class \code{HMSCdata} including the data used to perform the analysis}
  \item{\code{results}}{ This part of the output is divided in \code{burning} and \code{estimation}. For a particular model, both \code{burning} and \code{estimation} will have exactly the same structure, which may include the following objects: }
  \itemize{
    \item{\code{paramX}}{ A 3-dimensional array where, for each species (first dimension), the regression parameters of X (second dimension) are stored for all iterations (third dimension).}
    \item{\code{meansparamX}}{ A matrix where the estimation for each iterations (rows) is stored for each explanatory variables (column).}
    \item{\code{varX}}{ A 3-dimensional array where covariance matrices measuring how the species vary in their responses to the descriptors (first and second dimension) are stored for all iterations (third dimension).}
    \item{\code{paramTr}}{ A 3-dimensional array where, for each descriptors (first dimension), the regression parameters of Tr (second dimension) are stored for all iterations (third dimension).}
    \item{\code{paramPhylo}}{ A single column matrix where each the burning (or estimated) parameter associated to phylogeny is stored.}
    \item{\code{paramLatent}}{ A matrix of lists where the rows of the matrix is associated to each random effect considered and where all iterations are stored as individual matrix rows. Each cell of the matrix includes a list where for each (rows) the parameters of the latent variables are stored (columns). }
    \item{\code{latent}}{ A matrix of lists where the rows of the matrix is associated to each random effect considered and where all iterations are stored as individual matrix rows. Each cell of the matrix includes a list where latent variables are stored as columns and the rows are associated to the sampling units defined by the random effect. }
    \item{\code{paramLatentAuto}}{ A matrix of lists where the rows of the matrix is associated to each autocorrelated random effect considered and where all iterations are stored as individual matrix rows. Each cell of the matrix includes a list where for each (rows) the parameters of the autocorrelated latent variables are stored (columns). }
    \item{\code{latentAuto}}{ A matrix of lists where the rows of the matrix is associated to each autocorrelated random effect considered and where all iterations are stored as individual matrix rows. Each cell of the matrix includes a list where autocorrelated latent variables are stored as columns and the rows are associated to the sampling units defined by the autocorrelated random effect. }
    \item{\code{paramAuto}}{ A matrix of lists where the rows of the matrix is associated to each autocorrelated random effect considered and where all iterations are stored as individual matrix rows. Each cell of the matrix includes a list where a parameter weighting each autocorrelated latent variables is stored. }
  }
 }
}
\description{
Perform various types of hierarchical modelling analysis on community data
}
\details{
The choice of family is currently limited to \code{"probit"}, \code{"gaussian"}, \code{"poisson"} and \code{"overPoisson"} and the default is \code{"probit"}.

It is \strong{very important} to know that the models constructed for abundance data (\code{"poisson"}) needs one or two \emph{order of magnitude} more iterations (that is 10 or 100 times more interations) for the model parameter's to be properly estimated. Note also that for the Poisson models, simulations have shown that extremely large parameter values tends to be slightly underestimated, which should not affect the interpretation of the Poisson models.

When thinning, the value given to \code{thin} means that all but the \emph{k}^{th} values will be considered.

This function makes it possible to build models that consider habitat characteristics. The way to define how these models relies on the data is included in \code{data}.
}
\examples{
#================
### Generate data
#================
desc <- cbind(scale(1:50), scale(1:50)^2)
nspecies <- 20
commDesc <- communitySimul(X = desc, nsp = nspecies)

#=============
### Formatting
#=============
### Format data
formdata <- as.HMSCdata(Y = commDesc$data$Y, X = desc, interceptX = FALSE, interceptTr = FALSE)

#==============
### Build model
#==============
modelDesc <- hmsc(formdata, niter = 2000, nburn = 1000, thin = 1, verbose = 100)

}
\references{
Bhattacharya, A. and Dunson, D.B. (2011) Sparse Bayesian infinite factor models. \emph{Biometrika} \strong{98}, 291-306.

Ovaskainen, O. and Soininen, J. (2011) Making more out of sparse data: hierarchical modeling of species communities. \emph{Ecology} \strong{92}, 289-295.

Ovaskainen, O., G. Tikhonov, A. Norberg, F. G. Blanchet, L. Duan, D. Dunson, T. Roslin and Abrego, N. (2017) How to make more out of community data? A conceptual framework and its implementation as models and software. \emph{Ecology Letters} \strong{20}, 561-576.
}
\author{
F. Guillaume Blanchet
}
\keyword{htest,}
\keyword{models,}
\keyword{multivariate}
