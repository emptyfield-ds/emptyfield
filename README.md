
<!-- README.md is generated from README.Rmd. Please edit that file -->

# emptyfield

<!-- badges: start -->

[![R-CMD-check](https://github.com/emptyfield-ds/emptyfield/workflows/R-CMD-check/badge.svg)](https://github.com/emptyfield-ds/emptyfield/actions)
<!-- badges: end -->

The goal of emptyfield is to download learning materials for Empty Field
Data Science courses and workshops, as well as to install any required
packages. emptyfield also allows you to open a given module in RStudio
Cloud.

## Installation

You can install the latest version of emptyfield with:

``` r
options(repos = c(
  emptyfieldds = "https://emptyfield-ds.r-universe.dev",
  CRAN = "https://cran.rstudio.com/"
))

install.packages("emptyfield")
```

## Installing modules

`use_module()` will install the materials for a given module on your
computer. Then, it will open a new RStudio Project containing the files
you”ll need.

``` r
emptyfield::use_module("module_name")
```

By default, this package downloads the materials to a conspicuous place
like your Desktop. You can also tell `use_module()` exactly where to put
the materials with `destdir`:

``` r
emptyfield::use_module("module_name", destdir = "a/path/on/your/computer")
```

## Opening modules in RStudio Cloud

`browse_cloud()` opens a module in RStudio Cloud, where the materials
and all necessary tooling will be pre-installed. This requires an
RStudio Cloud account.

``` r
emptyfield::browse_cloud("module_name")
```
