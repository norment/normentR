#' ggplot scale_color element
#'
#' Add the NORMENT colors to a ggplot object. This function can be used as one
#' would always use the `scale_color_*` objects, except it requires the added
#' input whether the colors required need to be discrete or continuous, this of
#' course depends on the data that you're trying to plot. It can also take input
#' of which of the NORMENT color palettes you want to use. For a list of the
#' available color palettes type `available_palettes()`. Lastly, you can also 
#' tell this function to reverse the colors in the opposite direction as 
#' standard. It's possible to use both US English `color` or UK English `colour` 
#' in the function.
#' 
#' @usage
#' plot.obj + scale_color_norment(discrete = FALSE, palette = "gradient", reverse = TRUE)
#' plot.obj + scale_colour_norment(discrete = TRUE, palette = "mixed", reverse = FALSE)
#'
#' @export

scale_color_norment <- function(discrete = TRUE, palette = "default", reverse = FALSE, ...) {
  pal = norment_pal(palette = palette, reverse = reverse)
  if (discrete) {
    discrete_scale("color", paste0("norment_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' @export
scale_colour_norment <- scale_color_norment
