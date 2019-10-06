#' Calculate Cohen's d
#'
#' Calculate Cohen's d from the input to a T-test. Assign the input vectors you
#' would input into a `t.test()` function into this function. This function will
#' in turn calculate Cohen's D. NOTE: this function works only for an
#' independent samples T-test (for now).
#' 
#' @param x vector or column with observations (numeric or integer)
#' @param y vector or column with observations (numeric or integer)
#'
#' @usage 
#' CohensD <- cohens_d(x = data1$x, y = data2$x)
#' CohensD <- cohens_d(x = rnorm(n = 20, mean = 5, sd = 1),
#'                     y = rnorm(n = 20, mean = 6, sd = 0.5))
#'
#' @export

cohens_d <- function(x = NULL, y = NULL) {
  
  if (is.null(x)) { warning("x cannot be empty, no default is available for x, please assign a numeric vector"); return() }
  if (is.null(y)) { warning("y cannot be empty, no default is available for y, please assign a numeric vector"); return() }
  
  if (is.character(x)) { warning("x cannot be a character string, please assign a numeric vector"); return() }
  if (is.character(y)) { warning("x cannot be a character string, please assign a numeric vector"); return() }
  
  M1 <- mean(x)
  s1 <- sd(x)
  M2 <- mean(y)
  s2 <- sd(y)
  
  sdp <- sqrt((s1^2 + s2^2) / 2)
  d <- (M1 - M2) / sdp
  
  return(d)
}
