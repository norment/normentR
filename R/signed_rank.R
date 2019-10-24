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

signed_rank = function(x) {
  sign(x) * rank(abs(x))
}