\name{tp}

\alias{tp}

\title{Specify a Unimodal Category in a CHANGEPT Formula}

\description{A symbolic routine to define that the underlying mean curve is unimodal and has a turn-around point in the formula argument to changept.}

\usage{tp(x, sh = 1)}

\arguments{
  \item{x}{The predictor vector.}
  \item{sh}{If sh is \eqn{1}, then the estimated curve is increasing-decreasing; if sh is \eqn{-1},  it is decreasing-increasing.}
}


\value{ "tp" returns the vector "x" with three attributes, i.e., nm: the name of x; categ: the category of the change-point, "mode"; sh: the shape constraint on the estimated curve: \eqn{1} (increasing-decreasing) or \eqn{-1} (decreasing-increasing).

 The nm and categ attributes are used in the plot routine; the sh attribute is used to set up a shape-constrained regression. 
}

\author{Xiyue Liao}

\seealso{\code{\link{ip}}, \code{\link{jp}}}

\examples{
  # the underlying mean curve is unimodal with a mode at .8 
  n = 100
  x = seq(1/n, 1, length = n)
  # a categorical covariate z with two levels: 0 and 1 
  z = rep(0:1, 50)
  set.seed(123)
  y = 30 * x^4 * (1 - x) + (z == 1) * .5 + rnorm(n, sd = 1)
  ans = changept(y ~ tp(x) + factor(z), family = gaussian())
  plot(ans)
  legend("topleft", "constrained fit for z == 1", bty = "n", col = "skyblue", lty = 2, lwd = 2)
}

\keyword{symbolic routine}
