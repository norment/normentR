# NORMENT <img src="man/figures/logo_wname.png" align="right" alt="" width="160" />

The very much unofficial package to create plots in `ggplot` using the NORMENT house style.

## Installation
This package is not available on CRAN, and likely won't be for the forseeable future. The only way to install it is by either getting the source file for installation on the TSD or any other machine without internet connection or installing it using the `devtools` package (which is recommended). The latter option requires the `devtools` package to be installed and loaded.
```{r, eval = FALSE}
# Install latest version
devtools::install_github("norment/NORMENT", auth_token = <token>)
```

## Functionality

The functions and tools in this package are:
```{r, eval = FALSE}
theme_norment()
scale_color_norment(discrete = TRUE, palette = "default")
scale_fill_norment(discrete = TRUE, palette = "default")
show_norment_logo()
shift_axes()
```

There are a few other scripts in this package, which are mainly used for color definitions and scripts to create the color definitions into formats that can be used with the `ggplot` function.

## Color Palettes

All colors used in this package come from either the NORMENT design guide, or colors frequently used by NORMENT (such as in the logo). Possible options for the color palette are:
```{r, eval = FALSE}
"default" # Main colors from the NORMENT style guide
"logo" # Colors used in the logo
"purple" # Shades of purple
"blue" # Shades of blue
"mixed" # Colors with the maximum variance
"gradient" # Gradient from dark purple to dark blue with green in the middle
"gradient light" # Same as above but with lighter colors
"spectrum" # Colors with white in the middle, good for correlation matrices
"grey" # Grey scale
```

## Functions not directly compatible with ggplot

There are two functions that cannot be added as an element to a `ggplot` object, but (for now) only work as a function that takes the output of the `ggplot` object. There can be used like shown below:
```{r, eval = FALSE}
# Add NORMENT logo to plot
show_norment_logo(plot.obj)

# Shift axes to specific place on x- and y-axes
shift_axes(plot.obj, x = 0, y = 0)
```
