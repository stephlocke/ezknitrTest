orig <- getwd()

# wd() to part level e.g. inst/lvl1a/
ezknitr::ezknit("part1.Rmd","inst/lvl1a")

# setwd() to top level e.g. inst/
ezknitr::ezknit("part0.Rmd","inst")

