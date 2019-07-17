#' Negation of the infix 'in' operator
#'
#' This function is the opposite of the "%in%" operator. It works the same, and
#' can be used in the same situations. It selects all cases not in another
#' vector. Output is TRUE or FALSE, never NA.
#' 
#' @name notin
#' @rdname notin
#' @export

"%!in%" <- function(x,y) {
  !("%in%"(x,y))
}