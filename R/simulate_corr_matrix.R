#' Simulate correlation matrix
#' 
#' Simulate correlation matrix or any other matrix. Values are normally
#' distributed around the mean and standard deviation.
#' 
#' @param nnodes Number of nodes
#' @param mean Number of individuals in dataset
#' @param sd Add significant SNPs (logical)
#' @param shape Shape of the correlation matrix ("full","upper","lower")
#'
#' @usage 
#' corr.matrix <- simulate.corr.matrix(60)
#' corr.matrix <- simulate.corr.matrix(nnodes = 40, mean = 0, sd = 0.5,
#'    shape = "upper")
#' corr.matrix <- simulate.corr.matrix(nnodes = 180, mean = 100, sd = 6,
#'    shape = "lower")
#'
#' @export

simulate_corr_matrix <- function(nnodes = NULL,
                         mean = 0,
                         sd = 0.25,
                         shape = "full") {
  
  if (is.null(nnodes)) {
    warning("Number of nodes not specified, with no default, exiting")
    return()
  }
  
  nedges <- ((nnodes^2) - nnodes) / 2
  corr <- rnorm(nedges, mean = mean, sd = sd)
  
  if (shape == "full") {
    corr.matrix <- get.full.matrix(corr, nnodes)
  } else if (shape == "upper") {
    corr.matrix <- get.upper.half.matrix(corr, nnodes)
  } else if (shape == "lower") {
    corr.matrix <- get.lower.half.matrix(corr, nnodes)
  } else {
    warning('No valid shape defined, options are: "full", "upper", or "lower"')
    return()
  }
  
  return(corr.matrix)
  
}