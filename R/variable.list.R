#' Get variable list
#'
#' This function is a wrapper for both the \code{ls()} and the \code{typeof} function.
#' Output is a data frame with the index, variable name, and the type of all variables 
#' in the global environment (\code{.GlobalEnv}).
#'
#' @usage
#' variable.list()
#'
#' @export

variable.list <- function(pattern = glob2rx("*")) {

  type <- unlist(eapply(.GlobalEnv, typeof))
  names <- ls(pattern = pattern, envir = .GlobalEnv, sorted = TRUE)
  
  varlist <- data.frame()
  for (i in seq_along(names)) {
    varlist[i,"index"] <- i
    varlist[i,"varname"] <- names[i]
    varlist[i,"type"] <- type[names[i]]
  }
  
  message("Variables sorted alphabetically")
  
  return(varlist)
  
}
