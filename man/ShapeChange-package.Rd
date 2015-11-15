\name{ShapeChange-package}
\alias{ShapeChange-package}
\alias{ShapeChange}
\docType{package}
\title{Change-Point Estimation using Shape-Restricted Splines}

\description{
Given a scatterplot of \eqn{(x_i, y_i)}, \eqn{i = 1,\ldots,n}, where \eqn{\bold{x}} is the predictor and \eqn{\bold{y}} is the response which could be Gaussian, Poisson and binomial. The underlying mean curve in this scatterplot is denoted as \eqn{\bold{f_m(x)}}. where \eqn{\bold{f_m(x)}} is a smooth curve with a change-point \eqn{m} which falls in one of the three categories:
\itemize{
\item{a mode in a unimodal smooth curve}
\item{an inflection point in a convex-concave (concave-convex) smooth curve}
\item{a jump point in an otherwise smooth curve}.
}

Given the category of the change-point specified by the user, the main routine "changept" estimates the mean curve and the change-point as well using shape-restricted B-splines.

See \code{\link{changept}} for more details.
}

\details{
\tabular{ll}{
Package: \tab ShapeChange\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2015-11-14\cr
License: \tab GPL (>= 2)\cr
}
}

\author{
Xiyue Liao and  Mary C. Meyer

Maintainer: Xiyue Liao <xiyue@rams.colostate.edu>
}

\keyword{package}

