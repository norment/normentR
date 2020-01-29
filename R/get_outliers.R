#' Get outliers
#' 
#' Get the outliers from a vector. Uses the `boxplot()` function to detect
#' outliers. To remove outliers from a vector, use indexing using the output
#' from this function or use the `remove_outliers()` function.
#'
#' @export

get_outliers <- function(vector = NULL) {
  
  if (!is.numeric(vector)) {
    warning("No numeric vector provided, please provide a numeric vector")
  }
  
  outliers <- boxplot(vector, plot = FALSE)$out
  
  return(outliers)
}

#' Remove outliers from vector
#' 
#' As default, this function replaces the outliers with `NA`. Setting the 
#' `replace_with_na` setting to `FALSE` will remove the outliers from a vector,
#' and thus return a shorter vector.
#'
#' @export

remove_outliers <- function(vector = NULL, replace_with_na = TRUE) {
  
  if (!is.numeric(vector)) {
    warning("No numeric vector provided, please provide a numeric vector")
  }
  
  outliers <- get_outliers(vector = vector)
  if (replace_with_na) {
    vector[vector %!in% outliers] <- NA
    vec_out <- vector
  } else {
    vec_out <- vector[vector %!in% outliers]
  }
  
  return(vec_out)
}

