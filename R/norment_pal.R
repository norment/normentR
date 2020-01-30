#' Get NORMENT palette colors
#'
#' @keywords internal
#' @export

norment_pal <- function(palette = "default", reverse = FALSE,...) {
  set.seed(as.numeric(Sys.time()))
  if (palette == "random") {
    pal <- sample(norment_palette[[palette]])
  } else {
    pal <- norment_palette[[palette]]
  }
  if (reverse) pal <- rev(pal)
  return(colorRampPalette(pal, ...))
}
