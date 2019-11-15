#' Get NORMENT palette colors
#'
#' @export

norment_pal <- function(palette = "default", reverse = FALSE, ...) {
  if (palette == "random") {
    set.seed(as.numeric(Sys.time()))
    pal <- sample(norment_palette[[palette]])
  }
  pal <- norment_palette[[palette]]
  if (reverse) pal <- rev(pal)
  colorRampPalette(pal, ...)
}
