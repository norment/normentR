#' Shift axes
#'
#' This functions shifts the axes from the default position to a prespecified
#' position on the x- or y-axis. This can be particularly useful for plots that
#' have the null coordinate at x=0 and y=0. This function does not apply itself
#' to the ggplot object directly, but rather takes the ggplot object as input.
#'
#' Usage as as follows
#' shift_axes(ggobj, x = 0, y = 0)
#'
#' @export

shift_axes <- function(plot.obj, x=0,y=0){
  g <- ggplotGrob(plot.obj)
  dummy1 <- data.frame(y=y)
  dummy2 <- data.frame(x=x)
  ax1 <- g[["grobs"]][g$layout$name == "axis-b"][[1]]
  ax2 <- g[["grobs"]][g$layout$name == "axis-l"][[1]]
  plot.obj + annotation_custom(grid::grobTree(ax1, vp = grid::viewport(y=1, height=sum(ax1$height))),
                        ymax=y, ymin=y) +
    annotation_custom(grid::grobTree(ax2, vp = grid::viewport(x=1, width=sum(ax2$height))),
                      xmax=x, xmin=x) +
    geom_hline(aes(yintercept=y), data = dummy1,color="#cccccc") +
    geom_vline(aes(xintercept=x), data = dummy2,color="#cccccc") +
    theme(axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          axis.text.x = element_blank(),
          axis.ticks.x = element_blank())
}
