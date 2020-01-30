#' Obtain signed rank
#'
#' Transform a vector of values to its signed rank. This is sometimes necessary
#' in cases where your data is normally distributed. For instance the Wilcoxon
#' signed-rank test uses the signed rank of the vector.
#' 
#' @param x Vector with numeric or integer data
#'
#' @usage 
#' x_signed_rank <- signed_rank(x)
#'
#' @export

signed_rank <- function(x) {
  
  if (!is.numeric(from) & !is.integer(from)) { warning("No numeric vector provided, please provide a numeric vector"); return() }
  if (is.null(x)) { warning("x cannot be empty, no default is available for x, please assign a numeric or integer vector"); return() } 
  if (length(x) == 0) { warning("x cannot be empty, no default is available for x, please assign a numeric or integer vector"); return() } 
  
  x_sign <- sign(x) * rank(abs(x))
  
  return(x_sign)
}