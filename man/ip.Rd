\name{ip}

\alias{ip}

\title{Specify an Inflection-Point Category in a CHANGEPT Formula}

\description{A symbolic routine to define that the underlying mean curve has an inflection-point in the formula argument to changept.}

\usage{ip(x, sh = 1)}

\arguments{
  \item{x}{The predictor vector.}
  \item{sh}{If sh is \eqn{1}, then the estimated curve is convex-concave; if sh is \eqn{-1}, it is concave-convex. Note that when the response is binomial or Poisson, sh is always \eqn{1}. The default is sh = \eqn{1}.}
}

\value{The vector "x" with three attributes, i.e., nm: the name of x; categ: the category of the change-point, "inflect"; sh: the shape constraint on the estimated curve: \eqn{1} (convex-concave) or \eqn{-1} (concave-convex).

  The nm and categ attributes are used in the plot routine; the sh attribute is used to set up a shape-constrained regression. 
}


\author{Xiyue Liao}

\seealso{\code{\link{tp}}, \code{\link{jp}}}

\examples{
  # the underlying mean curve is a non-decreasing growth curve 
  # with an inflection point at .5 and it is convex-concave
  n = 100
  x = seq(1/n, 1, length = n)

  set.seed(123)
  y = 5 * (1 + tanh(10 * (x - .5)))  + rnorm(n, sd = 1)
  ans = changept(y ~ ip(x, sh = 1), fir = TRUE)

  plot(ans)
}

\keyword{symbolic routine}
