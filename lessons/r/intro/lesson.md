---
layout: page
title: 'Intro to R'
visible: true
tags:
  - r
  - beginner
---

 - **Authors**: Ahmed Hasan
 - **Research field**: Biology
 - **Lesson topic**: Introduction to R (with a focus on `dplyr` and `ggplot`)
 - **Lesson content URL**: <https://github.com/utm-coders/studyGroup/tree/gh-pages/lessons/python/intro>

## Preface: ##

This is a very basic introduction to the R programming language with a
particular focus on the `dplyr` and `ggplot` packages.  It is based partially
on openly available material from [Data Carpentry][data-carpentry] and
[EEB313][rcourse].  Instead of covering more advanced statistical methods, this
lesson aims to provide an understanding of fundamental data manipulation and
visualiztion operations in R. 

We will be working through the material together in RStudio [rstudio] using the
R Notebook [r-notebook] file format. To use RStudio, you will also have to download
standalone R [here][r-install]. 

Please make sure to have `dplyr`, `readr`, `knitr`, and `ggplot2` installed:

```R
install.packages('dplyr')
install.packages('readr')
install.packages('knitr')
install.packages('ggplot2')
```

To install `dplyr`, `readr`, and `ggplot2` all at once alongside 
other useful R packages:

```R
install.packages('tidyverse')
```

## Lesson Overview: ##

The lesson covers:

* The R/RStudio interface and R Notebooks
* Objects and functions
* Data frames
* The `dplyr` package
* Reading and writing files in R 
* Introductory plotting with `ggplot2`
* Knitting Rmd files

[data-carpentry]: https://datacarpentry.org/R-ecology-lesson/
[rcourse]: https://uoftcoders.github.io/rcourse/
[rstudio]: https://www.rstudio.com/products/rstudio/download/
[r-install]: https://cran.r-project.org/bin/
[r-notebook]: https://bookdown.org/yihui/rmarkdown/notebook.html
