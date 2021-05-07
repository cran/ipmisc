
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `ipmisc`: Miscellaneous Functions for Data Cleaning and Analysis

[![CRAN\_Release\_Badge](https://www.r-pkg.org/badges/version-ago/ipmisc)](https://CRAN.R-project.org/package=ipmisc)
[![Daily downloads
badge](https://cranlogs.r-pkg.org/badges/last-day/ipmisc?color=blue)](https://CRAN.R-project.org/package=ipmisc)
[![Total downloads
badge](https://cranlogs.r-pkg.org/badges/grand-total/ipmisc?color=blue)](https://CRAN.R-project.org/package=ipmisc)
[![R build
status](https://github.com/IndrajeetPatil/ipmisc/workflows/R-CMD-check/badge.svg)](https://github.com/IndrajeetPatil/ipmisc)
[![pkgdown](https://github.com/IndrajeetPatil/ipmisc/workflows/pkgdown/badge.svg)](https://github.com/IndrajeetPatil/ipmisc/actions)
[![Licence](https://img.shields.io/badge/licence-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![minimal R
version](https://img.shields.io/badge/R%3E%3D-3.6.0-6666ff.svg)](https://cran.r-project.org/)
[![Codecov test
coverage](https://codecov.io/gh/IndrajeetPatil/ipmisc/branch/master/graph/badge.svg)](https://codecov.io/gh/IndrajeetPatil/ipmisc?branch=master)
[![status](https://tinyverse.netlify.com/badge/ipmisc)](https://CRAN.R-project.org/package=ipmisc)
<!-- [![Coverage Status](https://coveralls.io/repos/github/IndrajeetPatil/ipmisc/badge.svg?branch=master)](https://coveralls.io/github/IndrajeetPatil/ipmisc?branch=master) -->
<!-- [![Travis Build Status](https://travis-ci.org/IndrajeetPatil/ipmisc.svg?branch=master)](https://travis-ci.org/IndrajeetPatil/ipmisc)  -->
<!-- [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/IndrajeetPatil/ipmisc?branch=master&svg=true)](https://ci.appveyor.com/project/IndrajeetPatil/ipmisc)  -->

# Introduction

The `ipmisc` provides functions for data cleaning and formatting. These
functions form data cleaning backend for the following packages:

-   `ggstatsplot`: <https://indrajeetpatil.github.io/ggstatsplot/>
-   `statsExpressions`:
    <https://indrajeetpatil.github.io/statsExpressions/>
-   `pairwiseComparisons`:
    <https://indrajeetpatil.github.io/pairwiseComparisons/>

**Note**: The `ipmisc` functions are not expected to have much utility
outside of these packages. So, if you wish to use them, do so at your
own risk. 😉

# Installation

You can install the `CRAN` version of `ipmisc`:

``` r
install.packages("ipmisc")
```

And the development version from `GitHub` with:

``` r
remotes::install_github("IndrajeetPatil/ipmisc")
```

# Functions

Function to convert a tidy data to wide data:

``` r
library(ipmisc)

long_to_wide_converter(bugs_long, condition, desire, paired = TRUE)
#> # A tibble: 88 x 5
#>    rowid  HDHF  HDLF  LDHF  LDLF
#>    <int> <dbl> <dbl> <dbl> <dbl>
#>  1     1  10     9     6     6  
#>  2     3  10    10    10     5  
#>  3     4   9     6     9     6  
#>  4     5   8.5   5.5   6.5   3  
#>  5     6   3     7.5   0.5   2  
#>  6     7  10    10    10    10  
#>  7     8  10     9    10    10  
#>  8     9  10     6     9.5   9.5
#>  9    11   0     0     2.5   0  
#> 10    12  10     8.5   7.5   9.5
#> # … with 78 more rows
```

To see all available functionality, see the documentation provided here:
<https://indrajeetpatil.github.io/ipmisc/reference/index.html>
