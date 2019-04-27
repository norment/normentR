#' Show NORMENT color palettes
#'
#' This function shows the NORMENT color palettes as defined in
#' `norment_palette`. It is possible to either plot all by calling the function
#' without any input arguments, or it's possible to show only the one palette by
#' inserting the name of the color palette as argument.
#'
#' @usage
#' norment_palette()
#' norment_palette("gradient")
#'
#' @export

show_norment_palette <- function(palettes = names(norment_palette)) {
  dims <- n2mfrow(length(palettes))
  oldpar <- par(mfrow = dims, mai = par('mai')/5)
  on.exit(par(oldpar))

  for (i in palettes) {
    image(matrix(1:100, ncol = 1), col = norment_palette[[i]], main = i, axes = FALSE)
  }
}
