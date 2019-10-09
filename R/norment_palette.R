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
#' @references The "scico" palettes included here were developed by Fabio 
#' Crameri at the University of Oslo, and ported to R by Thomas Pedersen. The 
#' "ggsci" were developed by Nan Xiao and were developed for his "ggisci" 
#' package.
#'
#' @name norment_palette
#' @export

# Get scico palettes
load(system.file("scico_palettes.rda", package = "normentR"))

rgb2hex <- function(df) rgb(df$r, df$g, df$b, maxColorValue = 1)

scico <- list()
for (i in names(scico_palettes)) {
  foo <- scico_palettes[[i]]
  foo.hex <- rgb2hex(foo)
  scico[i] <- list(foo.hex)
}

# Get ggsci palettes
load(system.file("ggsci_palettes.rda", package = "normentR"))

ggsci <- list()
for (i in names(ggsci_palettes)) {
  foo.names <- names(ggsci_palettes[[i]])
  ggsci[i] <- list(ggsci_palettes[[i]][[1]])
}

norment_manual_palette <- list(
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

norment_palette <- c(norment_manual_palette, scico, ggsci)