#' Calculate Standard Error of the Mean
#'
#' Calculate the standard error of the mean (SEM) on a vector of data. 
#' Takes input either with or without \code{NA}'s, and will then take input as to what 
#' to do with the \code{NA}'s in the \code{na.rm} option.
#' 
#' @param x Vector with numeric or integer data
#' @param na.rm Remove \code{NA}'s (\code{TRUE}/\code{FALSE})
#'
#' @usage 
#' rSEM <- sem(sample(1:100,50))
#' rSEM <- sem(c(NA,sample(1:100,50)), na.rm = TRUE)
#'
#' @export

sem <- function(x = NULL, na.rm = FALSE) {
  
  if (!is.numeric(from) & !is.integer(from)) { warning("No numeric vector provided, please provide a numeric vector"); return() }
  if (is.null(x)) { warning("x cannot be empty, no default is available for x, please assign a numeric or integer vector"); return() } 
  if (length(x) == 0) { warning("x cannot be empty, no default is available for x, please assign a numeric or integer vector"); return() } 

  if (na.rm) { x <- na.omit(x) }
  
  sem <- sd(x)/sqrt(length(x))
  
  return(sem)
}
