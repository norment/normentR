#' Definition of the NORMENT color palettes
#'
#' This list includes the default palettes included in the package. There are a
#' few flavors to choose from, such as "default", which includes the default
#' colors included in the NORMENT design guide, as well as "logo", which
#' includes colors featured on the NORMENT logo, and a few more. "purple" and
#' "blue" include only the purple and blue color variants of the NORMENT colors.
#' "mixed" uses different colors to maximize color variance in the palette.
#' "grey" uses only greyscale colors. For a full list of the available colors
#' type: `available_palettes()`, and to show the palettes type:
#' `show_norment_palette()`
#'
#' @export

norment_palette <- list(
  `default` = norment_cols("purple", "magenta", "blue", "green","yellow"),
  `logo` = norment_cols("purple", "light purple", "magenta", "light blue", "blue"),
  `purple`= norment_cols("purple", "light purple"),
  `blue` = norment_cols("blue", "light blue"),
  `mixed` = norment_cols("purple","magenta","blue","light blue","green","yellow"),
  `gradient` = norment_cols("purple","light purple","green","light blue","blue"),
  `gradient light` = norment_cols("light purple","green","light blue"),
  `spectrum` = norment_cols("purple","white","blue"),
  `profile` = norment_cols("grey","magenta","purple","blue","green","yellow"),
  `powerpoint` = norment_cols("purple","magenta","grey","blue","green","yellow"),
  `grey`  = norment_cols("grey", "light grey")
)
