#' Create a palette from the color definitions
#'
#' @keywords internal
#' @export

norment_cols <- function(...) {
  cols = c(...)
  if (is.null(cols))
    return (norment_colors)
  norment_colors[cols]
}
