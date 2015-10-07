\name{changept}
\alias{changept}

\title{Change-Point Estimation using Shape-Restricted Splines}

\description{'changept' is used to estimate the location of the change-point in the underlying mean curve of a scatterplot and the curve as well using shape-restricted B-splines. The change-point falls in one of the three categories: a mode, an inflection point and a jump point.}

\usage{changept(formula, family = gaussian(), categ = "mode", data = NULL, 
k = NULL, knots = NULL, fir = FALSE, q = 3, pnt = FALSE, pen = 0, 
ci = FALSE, nloop = 1e+3, constr = TRUE)}

\arguments{
  \item{formula}{A formula object which gives a symbolic description of the model to be fitted. It has the form "response ~ predictor". The response is a vector of length \eqn{n} and it is from one of the three exponential families: Gaussian, Poisson and binomial. The predictor is a nonparametrically modelled variable with a shape restriction. The user is supposed to indicate the relationship between the underlying mean curve \eqn{\bold{f_m(x)}} and the predictor \eqn{\bold{x}} in the following way:

    Assume that \eqn{\bold{f_m(x)}} is the underlying mean curve and \eqn{\bold{x}}  is the predictor: 
    \itemize{
    \item{tp(x, sh = 1): }{
		\eqn{\bold{f_m(x)}} is unimodal (increasing-decreasing) with a mode at \eqn{m}. See \code{\link{tp}} for more details.
    }
    \item{ip(x, sh = 1): }{\eqn{\bold{f_m(x)}} is convex-concave with an inflection point at \eqn{m}. See \code{\link{ip}} for more details.
}
    \item{jp(x,  trd1 = -1, trd2 = -1, up = TRUE): }{\eqn{\bold{f_m(x)}} is smooth with a jump point at \eqn{m} and non-increasing in a subinterval containing \eqn{m}. See \code{\link{jp}} for more details.}
    }
}

  \item{family}{ A parameter indicating the error distribution and link function to be used in the model. It can be a character string naming a family function or the result of a call to a family function. This is borrowed from the \bold{glm} routine in the stats package. There are three families used in changept: Gaussian, Poisson and binomial.}

  \item{categ}{The category of the change-point to be estimated. Three categories are included, i.e., a mode, an inflection point and a jump point.}

  \item{data}{An optional data frame, list or environment containing the variables in the model. The default is data = NULL.
}

  \item{k}{The number of knots. When it is NULL, \eqn{k} will be determined inside the changept routine according to the length of the predictor \eqn{\bold{x}}; otherwise, the user-defined \eqn{k} is used to create the knots. The default is NULL.}

  \item{knots}{The knots used to smoothly constrain a predictor. When it is NULL, a vector of knots will be created inside the changept routine; otherwise, the user-defined knots are used. The default is NULL. If both k and knots are defined by the user, only the knots parameter will be used.}

  \item{fir}{The parameter is used only when the change-point is an inflection point. When fir is TRUE, the estimated curve is constrained to be increasing at two end points. This is useful given the a priori information that the underlying mean curve is increasing over the whole interval, e.g., a growth curve. The default is FALSE.}

  \item{q}{The degree of penalty. It can be \eqn{1}, \eqn{2} or \eqn{3}. The default is \eqn{q = 3}.}

  \item{pnt}{Logical flag indicating if or not penalized B-splines are used. When pnt is TRUE, penalized B-splines are used; otherwise, unpenalized B-splines are used. The default is pnt = FALSE.}

  \item{pen}{The penalty term when penalized B-splines are used. It can only be a non-negative real number. When the user chooses penalized B-splines, the penalty term is determined inside the main routine if it is not defined by the user; otherwise, the user-defined value is used. The default is pen = \eqn{0}.}

  \item{ci}{Logical flag. If ci is TRUE, a \eqn{95\%} bootstrapping confidence interval of \eqn{m} will be delivered. The default is ci = FALSE.}

  \item{nloop}{The number of simulations used to get a bootstrap confidence interval for the change-point \eqn{m} when ci is TRUE. The default is nloop = 1e+3. }
  \item{constr}{Logical flag. It is used when \eqn{m} is a jump point. If constr is TRUE, no shape constraint is imposed on the estimated curve; otherwise, a shape constraint is imposed on the estimated curve in a subinterval containing \eqn{m}. See See \code{\link{jp}} for more details. The default is constr = TRUE.}
}

\details{
Given a scatterplot of \eqn{(x_i, y_i)}, \eqn{i = 1,\ldots,n}, where \eqn{\bold{x}} is the predictor and \eqn{\bold{y}} is the response which could be Gaussian, Poisson and binomial. The underlying mean curve in this scatterplot is denoted as \eqn{\bold{f_m(x)}}. where \eqn{\bold{f_m(x)}} is a smooth curve with a change-point \eqn{m} which falls in one of the three categories:
\itemize{
\item{a mode in a unimodal smooth curve}
\item{an inflection point in a convex-concave (concave-convex) smooth curve}
\item{a jump point in an otherwise smooth curve}.


For the unimodal case, quadratic B-splines are used; for the inflection-point case, cubic B-splines are used; for the jump-point case, quadratic B-splines along with two extra basis functions, i.e., the ramp basis function and the jump basis function are used.  The ramp basis function ensures that the slope of the estimated mean curve on the left of the jump point could be different from that on the right of the jump point. The jump basis function ensures that the estimated mean curve has a either upward or downward jump.


In each case,  the user can choose either unpenalized or penalized regression. For the unimodal case, the penalized regression is strongly suggested for its smoothness and robustness in terms of the number and the placement of knots, especially when the response is binomial; for the jump-point case, the user can choose to either make a shape-restricted fit or not by setting the parameter constr to be TRUE or FALSE. If constr is TRUE, a jump point will be detected and the monotonicity of the 
mean curve will be constrained in a subinterval which is made of two consecutive knots and contains the jump point; otherwise, a jump point will be detected without any shape restriction on the mean curve. 


A parametrically modelled categorical covariate can be included in the model for the unimodal case and the jump-point case. However, it cannot be included in the model for the inflection-point case since the problem of estimating an inflection point is not well-defined then. 


In addition, the user can get a \eqn{95\%} bootstrap confidence interval of \eqn{m} by setting the logical parameter ci to be TRUE. The default number of simulations to get such a confidence interval is 1e+3, which is defined by the parameter nloop. The genetic routine \bold{plot} can be used to show some estimated results including \eqn{\hat{f}_{\hat{m}}}, \eqn{\hat{m}} and a \eqn{95\%} bootstrapping confidence interval of \eqn{m} if it is available. 


See references cited in this section and the official manual (\url{https://cran.r-project.org/package=coneproj}) for the \bold{R} package \bold{coneproj} for more details.

}
}

\value{
\item{chpt}{The estimated change-point \eqn{\hat{m}}.}
\item{knots}{The knots used in the regression.}
\item{fhat}{The estimated mean curve \eqn{\hat{f}_{\hat{m}}}.}
\item{coefs}{The estimated coefficients of the B-spline basis functions for the shape-restricted predictor and the matrix whose columns represent the parametrically modelled categorical covariate if the user includes any in the model.}
\item{zcoefs}{The estimated coefficients of the matrix whose columns represent the parametrically modelled categorical covariate if the user includes any in the model.}
\item{cibt}{A \eqn{95\%} bootstrap confidence interval of \eqn{m} given that the parameter ci is TRUE.}
\item{categ}{The categ parameter in a changept formula.}
\item{sh}{The sh parameter in a changept formula.}
\item{x}{The predictor vector.}
\item{y}{The response vector.}
\item{xnm}{The name of the shape-restricted predictor.}
\item{znm}{The name of the parametrically modelled categorical covariate.}
\item{ynm}{The name of the response variable.}
\item{m_i}{The centering value for the ramp edge in the jump-point case.}
\item{pos}{The position of the knot \eqn{t_p} such that \eqn{t_{p-1} <= \hat{m} <= t_p, p=1,\ldots,k} and \eqn{k} is the number of knots.}
\item{sub}{The subinterval in which constrained regression is made in the jump-point case. It is of the form \eqn{[t_{p-1}, t_p]}. \eqn{t_{p-1} <= \hat{m} <= t_p, p=1,\ldots,k} and \eqn{k} is the number of knots.}
\item{family}{The family parameter in a changept formula.}
\item{wt.iter}{Logical flag indicating if or not iteratively re-weighted cone projections may be used. If the response is Gaussian, then wt.iter = FALSE; if the response is binomial or Poisson, then wt.iter = TRUE.}
\item{zmat}{A matrix whose columns represent the parametrically modelled categorical covariate if the user includes any in the model. The user can choose to include a constant vector in it or not. It must be of full column rank.}
\item{vals}{A vector storing the smallest value of each categorical variable defined as a factor(matrix).}
\item{is_fac}{Logical flag showing if a categorical variable is a factor(matrix) or not.}
\item{zid}{A vector keeping track of the position of the categorical variable in a changept formula.}
\item{zid1}{A vector keeping track of the beginning position of the levels(columns) of the categorical variable defined as a factor(matrix).}
\item{zid2}{A vector keeping track of the end position of the levels(columns) of the categorical variable defined as a factor(matrix).}
\item{tms}{The terms objects extracted by the generic function \bold{terms} from a changept fit. See the official help page (\url{http://stat.ethz.ch/R-manual/R-patched/library/stats/html/terms.html}) of the \bold{terms} function for more details.}
\item{msbt}{A bootstrap distribution of \eqn{m} given that the parameter ci is TRUE.}
\item{bmat}{A matrix whose columns are the B-spline basis functions for the shape-restricted predictor.}
}


\author{
Xiyue Liao and Mary C Meyer
}

\references{
  Meyer, M. C. (2008) Inference using shape-restricted regression splines. \emph{Annals of Applied Statistics \bold{2(3)}}, 1013--1033.

  Meyer, M.C. (2012) Constrained Penalized Splines. \emph{Canadian Journal of Statistics \bold{40(1)}}, 190--206. 

  Meyer, M. C. (2013b) A simple new algorithm for quadratic programming with applications in statistics. \emph{Communications in Statistics \bold{42(5)}}, 1126--1139.  
  
  Liao, X. and M. C. Meyer (2014) coneproj: An R package for the primal or dual cone projections with routines for constrained regression. \emph{Journal of Statistical Software \bold{61(12)}}, 1--22.

}


\examples{
  # Example 1: the response is normal 
  # the underlying mean curve has an inflection point at .5 and it is concave-convex
  n = 100
  inflect = .5
  x = seq(1/n, 1, length = n)
  
  set.seed(123)
  y = 50 * (x - inflect)^3 + rnorm(n, sd = 1)
  ans = changept(y ~ ip(x, sh = -1))
  plot(ans)

  # Example 2: the response is binomial
  # the underlying mean curve has an inflection point at .5 and it is convex-concave
  n = 100
  x = seq(1/n, 1, length = n)
  mu = exp(8 * x - 4) / (1 + exp(8 * x - 4))

  set.seed(123)
  y = rbinom(n, size = 1, prob = mu)
  ans = changept(y ~ ip(x), family = binomial())
  plot(ans)

  # Example 3: the response is normal
  # the underlying mean curve is unimodal with a mode at .5
  n = 100
  SD = .1
  x = seq(1/n, 1, length = n)
  mode = .5

  set.seed(123)
  y = -6 * (x - .5)^2 + rnorm(n, sd = SD)
  ans = changept(y ~ tp(x))
  plot(ans)

  # Example 4: the response is binomial
  # the underlying mean curve is unimodal with a mode at .5
  n = 200
  x = seq(1/n, 1, length = n)
  mu = .9 - 2.5 * (x - .5)^2

  set.seed(123)
  y = rbinom(n, size = 1, prob = mu)
  ans = changept(y ~ tp(x), family = binomial(), k = 10, pnt = TRUE)
  plot(ans, loc = "right")

  # Example 5: 
  library(datasets)
  # Nile River Data Set: Nile river flow is the response
  # an abrupt downward jump in the river flow occurred around the year 1898
  data(Nile)
  yrs = 1871:1970
  ans = changept(Nile ~ jp(yrs, up = FALSE, trd1 = 1, trd2 = 1), data = Nile)
  plot(ans)

}

\seealso{\code{\link{tp}}, \code{\link{ip}}, \code{\link{jp}}}

\keyword{changept}
