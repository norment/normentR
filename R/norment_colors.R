#' Get NORMENT colors
#'
#' This script contains definitions of the NORMENT colors. Colors are taken
#' directly from the NORMENT house design document. It also includes colors used
#' in the NORMENT logo and some other useful colors for greyscale documents that
#' fit well with the NORMENT theme also. The colors can be indexed in the list,
#' but can also be used as a non-named string by using:
#' norment.<color>
#' 
#' @usage 
#' norment_colors
#'
#' @export

norment_colors <- c(
  `purple` = "#5c2483",
  `light purple` = "#814994", # from logo
  `magenta` = "#e5007d",
  `blue` = "#0081c9",
  `light blue` = "#3CA2E6", # from logo
  `green` = "#21a695",
  `yellow` = "#d3d800",
  `black` = "#000000",
  `grey` = "#384044",
  `light grey` = "#cccccc",
  `white` = "#ffffff"
)

norment.purple <- norment_colors[["purple"]]
norment.light_purple <- norment_colors[["light purple"]]
norment.magenta <- norment_colors[["magenta"]]
norment.blue <- norment_colors[["blue"]]
norment.light_blue <- norment_colors[["light blue"]]
norment.green <- norment_colors[["green"]]
norment.yellow <- norment_colors[["yellow"]]
norment.black <- norment_colors[["black"]]
norment.grey <- norment_colors[["grey"]]
norment.light_grey <- norment_colors[["light grey"]]
norment.white <- norment_colors[["white"]]
