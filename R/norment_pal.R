#' Get NORMENT palette colors
#'
#' @export

norment_pal <- function(palette = "default", reverse = FALSE, ...) {
  pal = norment_palette[[palette]]
  if (reverse) pal = rev(pal)
  colorRampPalette(pal, ...)
}
