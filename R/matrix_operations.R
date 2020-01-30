#' Matrix modifications
#'
#' Performs matrix modifications:\cr
#' \code{get.full.matrix()}\cr
#' \code{get.upper.half.matrix()}\cr
#' \code{get.lower.half.matrix}\cr
#' 
#' Credit: Tobias Kaufmann

#' @title Get upper half of matrix
#' 
#' 
#' @author Daniel Roelfs
#' @name get_upper_half_matrix
#' @export

get_upper_half_matrix <- function(vector, nnodes) {
  m <- matrix(NA, nrow = nnodes, ncol = nnodes)
  s <- nnodes - 1
  e <- nnodes - 1
  for (i in seq_along(1:(nnodes-1))) {
    range1 <- (i+1):nnodes
    range2 <- (s-e+1):s
    m[i,range1] <- vector[range2]
    e <- e - 1
    s <- s + e
  }
  return(m)
}

#' @title Get lower half of matrix
#' 
#' Credit: Tobias Kaufmann
#' 
#' @author Tobias Kaufmann
#' @name get_lower_half_matrix
#' @export

get_lower_half_matrix <- function(vector, nnodes) {
  m <- matrix(NA, nrow = nnodes, ncol = nnodes)
  m[lower.tri(m)] <- vector
  return(m) 
}

#' @title Get full matrix
#' 
#' Credit: Tobias Kaufmann
#' 
#' @author Tobias Kaufmann
#' @name get_full_matrix
#' @importFrom pracma flipud
#' @importFrom pracma rot90
#' @export

get_full_matrix <- function(vector, nnodes) {
  
  m <- matrix(0, nrow = nnodes, ncol = nnodes)
  m[lower.tri(m)] <- vector
  m <- m + pracma::flipud(pracma::rot90(m))
  
  for (i in seq_along(1:nnodes)) {
    m[i,i] <- NA
  }
  
  return(m) 
}