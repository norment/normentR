#' Convert to full alpha hex
#'
#' Convert color with transparency to the equivalent color without transparency. 
#' 
#' @author Anthony Reinhard (Twitter: reinhurdler)
#'
#' @export

full_alpha_hex <- function(color, alpha) {
  old_rgb <- col2rgb(color)
  new_rgb <- (255 - (255 - old_rgb) * alpha) / 255
  out_col <- rgb(new_rgb["red", ], new_rgb["green", ], new_rgb["blue", ])
  return(out_col)
}