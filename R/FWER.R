#' Calculate FWER
#'
#' Calculate Family-Wise Error Rate (FWER) based on the number of comparisons 
#' and the alpha level. 
#' 
#' @param n Number of calculations
#' @param alpha Alpha level (default at 0.05)
#'
#' @usage 
#' PrFWER <- FWER(26)
#' PrFWER <- FWER(n = 72, alpha = 0.01)
#'
#' @export

FWER <- function(n = NULL, alpha = 0.05) {
  
  if (is.null(n)) warning("n cannot be empty, no default is available for n, please set the number of comparisons")
  if (alpha >= 1) warning("alpha level has to be between 0 and 1")
  
  FWER <- 1 - ((1 - alpha)^n)
  
  return(FWER)
}