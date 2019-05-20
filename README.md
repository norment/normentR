# normentR <img src="man/figures/logo_wname.png" align="right" alt="" width="160" />
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

The very much unofficial package with tools to create plots in `ggplot` using the NORMENT house style and other functionality tools useful for R users at NORMENT.

## Installation
This package is not available on CRAN, and likely won't be for the forseeable future. The only way to install it is by either getting the source file for installation on the TSD or any other machine without internet connection or installing it using the `devtools` package (which is recommended). The latter option requires the `devtools` package to be installed and loaded. Also, since this repository is private, you need a personal access token, generated by GitHub and pass it into the `auth_token` option as a string. For instructions on how to generate a personal access token, click [here](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line). Alternatively, it's possible to install the source package by downloading this package from the GitHub, by downloading a source file from the wiki, or by asking [Daniel](mailto:daniel.roelfs@medisin.uio.no) for the source file.
```{r, eval = FALSE}
# Install latest version
devtools::install_github("norment/normentR", auth_token = <token>)
```

## Functionality
The functions and tools in this package are:
```{r, eval = FALSE}
theme_norment()
scale_color_norment(discrete = TRUE, palette = "default")
scale_fill_norment(discrete = TRUE, palette = "default")
available_palettes()
show_norment_palette()
show_norment_logo()
shift_axes()
simulateGWAS()
clear()
```

There are a few other scripts in this package, which are mainly used for color definitions and scripts to create the color definitions into formats that can be used with the `ggplot` function. More functionality will be added over time.

## Simulate GWAS data
The `simulateGWAS` function generates a simulated dataset with similar properties to the PLINK output of the `--assoc` flag. Columns, values, and properties are similar to a regular GWAS from a UK Biobank sample with a quantitative phenotype.

## Functionality
Over the duration of a long coding session in R, the workspace with the variables can clog up somewhat. The `clear` function attempts to answer some of this. It is nothing more than a wrapper for the `rm` function, but it takes input. It's possible to either remove all variables, remove specific variables only (either individuals or matching a string), or remove all variables except an individual variable or variables matching a string. The last is particularly useful for working with large datasets that take a long time to load. A warning is warranted because this is a function function that acts on the global environment (`.GlobalEnv`) from the function environment.

## Color Palettes
All colors used in this package come from either the NORMENT design guide, or colors frequently used by NORMENT (such as in the logo or the order of the colors as used in the Powerpoint templates). Possible options for the color palette are stored in the function `available_palettes()`. To view all color palattes, type: `show_norment_palette()`. To view only one or more palettes, submit them as arguments into the last function as such: `show_norment_palette(c("default","gradient"))`.
In addition to the NORMENT colors, I'd also recommend checking out the `scico` package, which contains a bunch of scientific color palettes for various purposes. These color palettes were developed by [Fabio Crameri](http://www.fabiocrameri.ch/colourmaps.php), researcher at the Centre for Earth Evolution and Dynamics, also at the University of Oslo. A paper on these color palettes has been published (also see [here](https://www.geosci-model-dev.net/11/2541/2018/)). The color palettes in the `scico` package are in most cases superior to the standard color palettes provided by `ggplot2` and can be interpreted by for individuals with color-blindness too. I might implement the `scico` color palettes to this package at a later stage.

## Extensions that cannot be added to the ggplot object directly
There are two functions that cannot be added as an element to a `ggplot` object, but (for now) only work as a function that takes the the `ggplot` object as input. There can be used like shown below:
```{r, eval = FALSE}
# Add NORMENT logo to plot
show_norment_logo(plot.obj)

# Shift axes to specific place on x- and y-axes
shift_axes(plot.obj, x = 0, y = 0)
```
