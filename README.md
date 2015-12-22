# ezknitrTest
In my Rtraining repo, I store a lot of documents that rollup different hierarchies of documents and output them. This has become quite fugly and I've been looking for a solution to clean this up.

This repo contains a MWE of what I'm trying to achieve in order to evaluate the capabilities of the new package `ezknitr`.

## Install
Download this example repo as a package, and `ezknitr` will install
```{r}
if (!require(devtools)) install.packages("devtools")
devtools::install_github("stephlocke/ezknitrTest")
```

Alternatively, you can install ezknitr from CRAN.
```{r}
install.library("ezknitr")
```
## Structure
`inst/` contains documents that rollup sub-documents at various levels

- `inst/` contains `part0.Rmd` which rolls up `lvl1a/part1.Rmd` and `lvl1b/part2.Rmd`
    + The `part0.Rmd` refers to `part1.Rmd` as `'lvl1a/part1.Rmd'` 
    + The `part0.Rmd` refers to `part2.Rmd` as `'lvl1b/part2.Rmd'` 
- `inst/lvl1a` contains `part1.Rmd` which rolls up `lvl2a/subpart.Rmd`
    + The `part1.Rmd` refers to `subpart.Rmd` as `'lvl2a/subpart.Rmd'` 
- `inst/lvl1b` contains `part2.Rmd` which is a stub
- `inst/lvl1c` contains `partA.Rmd` which references a file in `inst/lvl1a`

## Testing
The `rendercheck.R` file then performs:
- knit `part1.Rmd` using `wd="inst/lvl1a"`
- knit `part0.Rmd` using `wd="inst"`
- knit `partA.Rmd` using `wd="inst/lvl1c"`

The first two tests assess the ability to integrete documents from different levels within the same hierarchy. The final test assesses the ability to integrate documents from a different area of the hierarchy.
