#' ggplot scale_fill element
#'
#' Add the NORMENT colors to a ggplot object. This function can be used as one
#' would always use the "scale_fill_*" objects, except it requires the added
#' input whether the colors required need to be discrete or continuous, this of
#' course depends on the data that you're trying to plot. It can also take input
#' of which of the NORMENT color palettes you want to use. For a list of the
#' available color palettes type "?norment_palettes". Lastly, you can also tell
#' this function to reverse the colors in the opposite direction as standard.
#'
#' @export

scale_fill_norment <- function(palette = "default", discrete = TRUE, reverse = FALSE, ...) {
  pal = norment_pal(palette = palette, reverse = reverse)
  if (discrete) {
    return(discrete_scale("fill", paste0("norment_", palette), palette = pal, ...))
  } else {
    return(scale_fill_gradientn(colours = pal(256), ...))
  }
}
