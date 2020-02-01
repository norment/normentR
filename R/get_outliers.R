#' Get outliers
#' 
#' Get the outliers from a vector. Uses the \code{boxplot()} function to detect
#' outliers. To remove outliers from a vector, use indexing using the output
#' from this function or use the \code{remove_outliers()} function.
#'
#' @export

get_outliers <- function(vector = NULL) {
  
  if (!is.numeric(vector)) { warning("No numeric vector provided, please provide a numeric vector") }
  
  outliers <- boxplot(vector, plot = FALSE)$out
  
  return(outliers)
}

#' Remove outliers from vector
#' 
#' As default, this function replaces the outliers with \code{NA}. Setting the 
#' \code{replace_with_na} setting to \code{FALSE} will remove the outliers from a vector,
#' and thus return a shorter vector. Works also within a pipe structure (\code{\%>\%}).
#' 
#' @usage 
#' data$x <- remove_outliers(data$x)
#' data <- data \%>\% mutate(x_no_outliers = remove_outliers(x))
#' 
#'
#' @export

remove_outliers <- function(vector = NULL, replace_with_na = TRUE) {
  
  if (!is.numeric(vector) & !is.integer(vector)) { warning("No numeric vector provided, please provide a numeric vector"); return() }
  
  outliers <- get_outliers(vector = vector)
  if (replace_with_na) {
    vector[vector %!in% outliers] <- NA
    vec_out <- vector
  } else {
    vec_out <- vector[vector %!in% outliers]
  }
  
  return(vec_out)
}

