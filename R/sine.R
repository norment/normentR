#' Create sine wave
#'
#' Provides a vector with the ouput from a \code{sin()} function. This function is 
#' nothng more than a wrapper for said function. It takes a range of the sine 
#' wave from a specific data point to a specific data point (e.g. -pi to pi).\cr
#' Another input is the length of the output vector. Useful for cases where you
#' want to perform a sine transformation on your data.
#' 
#' @param from single value indicated from where the vector should start
#' @param to single value indicated from where the vector should end
#' @param length length of the output vector
#'
#' @usage 
#' v <- sine(from = -2, to = 2*pi, length = 1000)
#' v <- sine(-pi, 20, 1e5)
#'
#' @export sine

sine <- function(from = NULL, to = NULL, length = 1000) {
  
  if (is.null(from)) { warning("from cannot be empty, no default is available for from, please assign a numeric or integer value"); return() } 
  if (is.null(to)) { warning("to cannot be empty, no default is available for from, please assign a numeric or integer value"); return() } 
  if (length(x) == 0) { warning("length of output cannot be zero, please assign a value larger than 1"); return() } 
  if (!is.numeric(from) & !is.integer(from)) { warning("from has to be a numeric or integer value"); return() } 
  if (!is.numeric(to) & !is.integer(to)) { warning("to has to be a numeric or integer value"); return() } 
  
  v <- sin(seq(from = from, to = to, length.out = length))
  
  return(v)
}