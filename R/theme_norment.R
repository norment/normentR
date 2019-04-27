#' NORMENT theme for ggplot objects
#'
#' This is a theme developed for use in combination with the `ggplot2` package.
#' It adds the default NORMENT font (Arial, support for other fonts used by
#' NORMENT might be added later). There's quite some space for text and
#' explanation, e.g. title, subtitle, caption, and so on. This theme is highly
#' adaptable, so many elements in each plot can be formatted to personal taste.
#' While this function contains the general style of the plot, it does not
#' automatically use the NORMENT colors on data presented in the plot. In order
#' to use the NORMENT colors also, please refer to the `scale_color_norment` and
#' the `scale_fill_norment` functions, also included in the `normentR` package.
#'
#' @import ggplot2
#' @export

theme_norment <- function(base_family = "sans",
                          base_size = 12,
                          plot_title_family = base_family,
                          plot_title_size = 18,
                          plot_title_face = "bold",
                          plot_title_margin = 10,
                          subtitle_family = base_family,
                          subtitle_size = 12,
                          subtitle_face = "plain",
                          subtitle_margin = 15,
                          strip_text_family = base_family,
                          strip_text_size = 12,
                          strip_text_face = "plain",
                          caption_family = base_family,
                          caption_size = 9,
                          caption_face = "italic",
                          caption_margin = 10,
                          axis_text_size = base_size,
                          axis_title_family = subtitle_family,
                          axis_title_size = 11.5, # was 9
                          axis_title_face = "plain",
                          axis_title_just = "c",
                          plot_margin = margin(30, 30, 30, 30),
                          grid_col = norment_colors[["light grey"]],
                          grid = TRUE,
                          axis_col = norment_colors[["light grey"]],
                          axis = FALSE,
                          ticks = FALSE,
                          transparent = FALSE) {
  
  #-- Settings for theme ---------------------
  
  theme.settings <- ggplot2::theme_minimal(base_family=base_family, base_size=base_size)
  
  theme.settings <- theme.settings + theme(legend.background = element_blank())
  theme.settings <- theme.settings + theme(legend.key = element_blank())
  
  if (inherits(grid, "character") | grid == TRUE) {
    
    theme.settings <- theme.settings + theme(panel.grid = element_line(color = grid_col, size = 0.2))
    theme.settings <- theme.settings + theme(panel.grid.major = element_line(color = grid_col, size = 0.2))
    theme.settings <- theme.settings + theme(panel.grid.minor = element_line(color = grid_col, size = 0.15))
    
    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) theme.settings <- theme.settings + theme(panel.grid.major.x = element_blank())
      if (regexpr("Y", grid)[1] < 0) theme.settings <- theme.settings + theme(panel.grid.major.y = element_blank())
      if (regexpr("x", grid)[1] < 0) theme.settings <- theme.settings + theme(panel.grid.minor.x = element_blank())
      if (regexpr("y", grid)[1] < 0) theme.settings <- theme.settings + theme(panel.grid.minor.y = element_blank())
    }
    
  } else {
    theme.settings <- theme.settings + theme(panel.grid = element_blank())
  }
  
  if (inherits(axis, "character") | axis == TRUE) {
    theme.settings <- theme.settings + theme(axis.line = element_line(color = norment_colors[["grey"]], size = 0.15)) # was #2b2b2b
    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        theme.settings <- theme.settings + theme(axis.line.x = element_blank())
      } else {
        theme.settings <- theme.settings + theme(axis.line.x = element_line(color=axis_col, size = 0.15))
      }
      if (regexpr("y", axis)[1] < 0) {
        theme.settings <- theme.settings + theme(axis.line.y = element_blank())
      } else {
        theme.settings <- theme.settings + theme(axis.line.y = element_line(color=axis_col, size = 0.15))
      }
    } else {
      theme.settings <- theme.settings + theme(axis.line.x = element_line(color = axis_col, size = 0.15))
      theme.settings <- theme.settings + theme(axis.line.y = element_line(color = axis_col, size = 0.15))
    }
  } else {
    theme.settings <- theme.settings + theme(axis.line = element_blank())
  }
  
  if (ticks) {
    theme.settings <- theme.settings + theme(axis.ticks = element_line(size=0.15))
    theme.settings <- theme.settings + theme(axis.ticks.x = element_line(size=0.15))
    theme.settings <- theme.settings + theme(axis.ticks.y = element_line(size=0.15))
    theme.settings <- theme.settings + theme(axis.ticks.length = grid::unit(5, "pt"))
  } else {
    theme.settings <- theme.settings + theme(axis.ticks = element_blank())
    theme.settings <- theme.settings + theme(axis.ticks.x = element_blank())
    theme.settings <- theme.settings + theme(axis.ticks.y = element_blank())
  }
  
  if (transparent) {
    theme.settings <- theme.settings +
      theme(panel.background = element_rect(fill = "transparent"),
            plot.background = element_rect(fill = "transparent", colour = "transparent"))
  }
  
  xj <- switch(tolower(substr(axis_title_just, 1, 1)), 
               b = 0, l = 0, m = 0.5, c = 0.5, r = 1, t = 1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), 
               b = 0, l = 0, m = 0.5, c = 0.5, r = 1, t = 1)
  
  theme.settings <- theme.settings +
    theme(axis.text.x = element_text(size = axis_text_size,
                                     margin = margin(t = 0)),
          axis.text.y = element_text(size = axis_text_size,
                                     margin = margin(r = 0)),
          axis.title = element_text(size = axis_title_size,
                                    family = axis_title_family),
          axis.title.x = element_text(hjust = xj,
                                      size = axis_title_size,
                                      family = axis_title_family,
                                      face = axis_title_face),
          axis.title.y = element_text(hjust = yj,
                                      size = axis_title_size,
                                      family = axis_title_family,
                                      face = axis_title_face),
          axis.title.y.right = element_text(hjust = yj,
                                            size = axis_title_size,
                                            angle = 90,
                                            family = axis_title_family,
                                            face = axis_title_face),
          strip.text = element_text(hjust = 0,
                                    size = strip_text_size,
                                    face = strip_text_face,
                                    family = strip_text_family),
          panel.spacing = grid::unit(2, "lines"),
          plot.title = element_text(hjust = 0,
                                    size = plot_title_size,
                                    margin = margin(b = plot_title_margin),
                                    family = plot_title_family,
                                    face = plot_title_face),
          plot.subtitle = element_text(hjust = 0,
                                       size = subtitle_size,
                                       margin = margin(b = subtitle_margin),
                                       family = subtitle_family,
                                       face = subtitle_face),
          plot.caption = element_text(hjust = 1,
                                      size = caption_size,
                                      margin = margin(t = caption_margin),
                                      family = caption_family,
                                      face = caption_face),
          plot.margin = plot_margin
    )
  
  #-- Additional theme settings ---------------------
  
  theme.settings <- theme.settings +
    theme(#line = element_blank(),
      rect = element_rect(),
      text = element_text(),
      title = element_text(),
      #aspect.ratio = element_blank(),
      #axis.title = element_blank(),
      #axis.title.x = element_blank(),
      #axis.title.x.top = element_blank(),
      #axis.title.x.bottom = element_blank(),
      #axis.title.y = element_blank(),
      #axis.title.y.left = element_blank(),
      #axis.title.y.right = element_blank(),
      #axis.text = element_blank(),
      #axis.text.x = element_blank(),
      #axis.text.x.top = element_blank(),
      #axis.text.x.bottom = element_blank(),
      #axis.text.y = element_blank(),
      #axis.text.y.left = element_blank(),
      #axis.text.y.right = element_blank(),
      #axis.ticks = element_blank(),
      #axis.ticks.x = element_blank(),
      #axis.ticks.x.top = element_blank(),
      #axis.ticks.x.bottom = element_blank(),
      #axis.ticks.y = element_blank(),
      #axis.ticks.y.left = element_blank(),
      #axis.ticks.y.right = element_blank(),
      #axis.ticks.length = element_blank(),
      #axis.line = element_blank(),
      #axis.line.x = element_blank(),
      #axis.line.x.top = element_blank(),
      #axis.line.x.bottom = element_blank(),
      #axis.line.y = element_blank(),
      #axis.line.y.left = element_blank(),
      #axis.line.y.right = element_blank(),
      #legend.background = element_blank(),
      #legend.margin = element_blank(),
      #legend.spacing = element_blank(),
      #legend.spacing.x = element_blank(),
      #legend.spacing.y = element_blank(),
      #legend.key = element_blank(),
      #legend.key.size = element_blank(),
      #legend.key.height = element_blank(),
      #legend.key.width = element_blank(),
      #legend.text = element_blank(),
      #legend.text.align = element_blank(),
      #legend.title = element_blank(),
      #legend.title.align = element_blank(),
      #legend.position = element_blank(),
      #legend.direction = "vertical",
      #legend.justification = element_blank(),
      #legend.box = element_blank(),
      #legend.box.just = element_blank(),
      #legend.box.margin = element_blank(),
      #legend.box.background = element_blank(),
      #legend.box.spacing = element_blank(),
      #panel.background = element_rect(color=norment_colors[["light grey"]]),
      #panel.border = element_blank(),
      #panel.spacing = element_blank(),
      #panel.spacing.x = element_blank(),
      #panel.spacing.y = element_blank(),
      #panel.grid = element_blank(),
      #panel.grid.major = element_blank(),
      #panel.grid.minor = element_blank(),
      #panel.grid.major.x = element_blank(),
      #panel.grid.major.y = element_blank(),
      #panel.grid.minor.x = element_blank(),
      #panel.grid.minor.y = element_blank(),
      #panel.ontop = element_blank(),
      #plot.background = norment_colors[["light grey"]],
      #plot.title = element_blank(),
      #plot.subtitle = element_blank(),
      #plot.caption = element_blank(),
      #plot.tag = element_blank(),
      #plot.tag.position = element_blank(),
      #plot.margin = element_blank(),
      #strip.background = element_blank(),
      #strip.background.x = element_blank(),
      #strip.background.y = element_blank(),
      #strip.placement = element_blank(),
      #strip.text = element_blank(),
      #strip.text.x = element_blank(),
      #strip.text.y = element_blank(),
      #strip.switch.pad.grid = element_blank(),
      #strip.switch.pad.wrap = element_blank(),
      complete = FALSE,
      validate = TRUE
    )
  
  theme.settings
  
}
