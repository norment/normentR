#' Calculate Standard Error of the Mean
#'
#' Calculate the standard error of the mean (SEM) on a vector of data. Takes
#' input either with or without NA's, and will then take input as to what to do
#' with the NA's in the `na.rm` option.
#' 
#' @param x Vector with numeric or integer data
#' @param na.rm Remove NA's (TRUE/FALSE)
#'
#' @usage 
#' rSEM <- sem(sample(1:100,50))
#' rSEM <- sem(c(NA,sample(1:100,50)), na.rm = TRUE)
#'
#' @export

sem <- function(x = NULL, na.rm = FALSE) {

  if (is.null(x)) { warning("x cannot be empty, no default is available for x, please assign a numeric or integer vector"); return() } 
  if (length(x) == 0) { warning("x cannot be empty, no default is available for x, please assign a numeric or integer vector"); return() } 
  if (!is.numeric(x) & !is.integer(x)) { warning("x has to be a numeric or integer vector of length > 1"); return() } 
  
  if (na.rm) { x <- na.omit(x) }
  
  sem <- sd(x)/sqrt(length(x))
  
  return(sem)
}
