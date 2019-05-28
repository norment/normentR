#' Matrix modifications
#'
#' Performs matrix modifications:
#' get.full.matrix()
#' get.upper.half.matrix()
#' get.lower.half.matrix
#' 
#' Credit: Tobias Kaufmann

#' @title get.upper.half.matrix
#' 
#' 
#' @author Daniel Roelfs
#' @name get.upper.half.matrix
#' @export

get.upper.half.matrix <- function(vector, nnodes) {
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

#' @title get.lower.half.matrix
#' 
#' Credit: Tobias Kaufmann
#' 
#' @author Tobias Kaufmann
#' @name get.lower.half.matrix
#' @export

get.lower.half.matrix <- function(vector, nnodes) {
  m <- matrix(NA, nrow = nnodes, ncol = nnodes)
  m[lower.tri(m)] <- vector
  return(m) 
}

#' @title get.full.matrix
#' 
#' Credit: Tobias Kaufmann
#' 
#' @author Tobias Kaufmann
#' @name get.full.matrix
#' @importFrom pracma flipud
#' @importFrom pracma rot90
#' @export

get.full.matrix <- function(vector, nnodes) {
  
  m <- matrix(0, nrow = nnodes, ncol = nnodes)
  m[lower.tri(m)] <- vector
  m <- m + pracma::flipud(pracma::rot90(m))
  
  for (i in seq_along(1:nnodes)) {
    m[i,i] <- NA
  }
  
  return(m) 
}