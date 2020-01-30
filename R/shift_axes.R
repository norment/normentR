#' Shift axes
#'
#' This functions shifts the axes from the default position to a prespecified
#' position on the x- or y-axis. This can be particularly useful for plots that
#' have the null coordinate at \code{x = 0} and \code{y = 0}. 
#' This function does not apply itself to the ggplot object directly, so it can't
#' be added as a layer, but rather takes the ggplot object as input.\cr
#' \cr
#' Minimal usage as follows:
#' \code{shift_axes(ggobj, x = 0, y = 0)}
#'
#' @export

shift_axes <- function(plot.obj = NULL, x = 0, y = 0, axis.col = "#cccccc") {
  
  g <- ggplotGrob(plot.obj)
  
  dummy1 <- data.frame(y = y)
  dummy2 <- data.frame(x = x)
  
  ax1 <- g[["grobs"]][g$layout$name == "axis-b"][[1]]
  ax2 <- g[["grobs"]][g$layout$name == "axis-l"][[1]]
  
  plot.obj + annotation_custom(grid::grobTree(ax1, vp = grid::viewport(y = 1, height = sum(ax1$height))),
                        ymax=y, ymin=y) +
    annotation_custom(grid::grobTree(ax2, vp = grid::viewport(x = 1, width = sum(ax2$height))),
                      xmax=x, xmin=x) +
    geom_hline(data = dummy1, aes(yintercept = y), color = axis.col) +
    geom_vline(data = dummy2, aes(xintercept = x), color = axis.col) +
    theme(axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          axis.text.x = element_blank(),
          axis.ticks.x = element_blank())
}
