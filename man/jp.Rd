\name{jp}
\alias{jp}

\title{Specify a Jump-Point Category in a CHANGEPT Formula}

\description{A symbolic routine to define that the underlying mean curve has a jump-point in the formula argument to changept.}

\usage{jp(x, trd1 = -1, trd2 = -1, up = TRUE)}

\arguments{
  \item{x}{The predictor variable.}
  \item{trd1}{If trd1 is \eqn{-1} (\eqn{1}), then the estimated curve is constrained to be decreasing (increasing) on the left of the estimated jump-point.}
  \item{trd2}{If trd2 is \eqn{-1} (\eqn{1}), then the estimated curve is constrained to be decreasing (increasing) on the right of the estimated jump-point.}
  \item{up}{The jump direction at the jump-point. The default is up = TRUE, i.e., there is an upward jump; otherwise, there is a downward jump.}
}

\value{The vector "x" with five attributes, i.e., nm: the name of x; categ: the category of the change-point, "jump"; trd1 and trd2: \eqn{-1}(decreasing) or \eqn{1} (increasing); up: the jump direction.

  The nm and categ attributes are used in the plot routine; the trd1, trd2 and up attributes are used to set up a shape-constrained regression.

}


\author{Xiyue Liao}

\seealso{\code{\link{tp}}, \code{\link{ip}}}

\examples{
\dontrun{
  # simulated curve with an upward jump at .7
  n = 1000
  x = seq(1/n, 1, length = n)
  set.seed(123) 
  y =  4 * sin(5 * x) + 3 * x + (x >= .7) + rnorm(n, sd = 1)
  ans = changept(y ~ jp(x))
  plot(ans)
} 
}


\keyword{symbolic routine}







