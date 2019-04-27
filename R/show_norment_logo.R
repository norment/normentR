#' Show the NORMENT logo on your ggplot object
#'
#' This function adds the NORMENT logo as a layer on top of your ggplot object.
#' You can specify whether you want the logo with the name or without. Please
#' pay attention that if you use the logo with the name, that you likely have to
#' reposition the logo with the "pos" variable. Minimal usage is as follows:
#'
#' show_norment_logo(ggobj)
#'
#' But more options can be set using the "with.name" option (TRUE/FALSE), the
#' "pos" option which takes a relative vector for the position. "just" to tell
#' it which justification to assume, and "size", which takes a "unit" element to
#' scale the size of the logo to the desired size.
#'
#' This function is not very elegant at the moment, but it might be improved
#' over time.
#'
#' @importFrom png readPNG
#' @importFrom grid rasterGrob
#' @export

show_norment_logo <- function(plot.obj = plot, with.name = FALSE, pos = c(0.96,0.05), just = "center", size = unit(25, "points"), ...){
  if (with.name) {
    logo.link <- system.file("logos/logo_wname.png", package = "normentR")
  } else {
    logo.link <- system.file("logos/logo.png", package = "normentR")
  }
  logo <- png::readPNG(logo.link)
  print(plot.obj)
  grid::grid.raster(logo, x = pos[1], y = pos[2], just = just, width = size)
}
