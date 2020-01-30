#' Clear variables
#'
#' This function is a wrapper for the \code{rm()} function. 
#' This function takes a pattern, which can include a wildcard (*, asterisk) 
#' in either the argument \code{remove} or \code{keep} to either remove or keep 
#' all objects matching a string.
#' It's possible to input multiple variable names in the \code{remove} argument, 
#' but it's not (yet) possible for the `keep` argument.
#'
#' @usage
#' clear()
#' clear(remove = "var")
#' clear(remove = "var*")
#' clear(remove = c("var1","var2"))
#' clear(keep = "var")
#' clear(keep = "var*")

#' @export

clear <- function(remove = NULL, keep = NULL) {
  
  pos = 1
  
  if (is.null(remove) && is.null(keep)) {
    
    rm(list = ls(pos = pos), pos = pos)
    
  } else if (is.character(remove) || is.character(keep)) {

    if (!is.null(remove) && is.null(keep)) {
      for (i in remove) {
        rm(list = ls(pattern = glob2rx(i), pos = pos), pos = pos)
      }
    } else if (is.null(remove) && !is.null(keep)) {
      has.wc <- grep(keep, "*")
      
      if (!is.character(keep)) {
        warning("Input is not a character")
      } else if (length(has.wc) == 0) {
        rm(list = setdiff(ls(pos = pos), keep), pos = pos)
      } else {
        rm(list = setdiff(ls(pos = pos), ls(pattern = glob2rx(keep), pos = pos)), pos = pos)
      }
    } else {
      warning("Multiple arguments used, please use only one")
    }
    
  } else {
    
    warning("\nInput must be strings!")
    
  }
  
}
