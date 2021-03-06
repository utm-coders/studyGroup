---
layout: page
title: 'Data visualization with ggplot2'
visible: true
tags:
  - r
  - intermediate
---

 - **Authors**: Ahmed Hasan and James Santangelo
 - **Research field**: Biology
 - **Lesson topic**: Data visualization in R with `ggplot2`
 - **Lesson content URL**: <https://github.com/utm-coders/studyGroup/tree/gh-pages/lessons/r/ggplot2>

## Preface: ##

This is an introduction to data visualization in R with the `ggplot2` package.
It is based partially on openly available material from [Data
Carpentry][data-carpentry] and [EEB313][rcourse]. This lesson covers most
standard kinds of plots used in biological research, such as scatter plots and
histograms before discussing plot customization, faceting, and other
intermediate topics. 

The lesson assumes knowledge of some of the material covered in our [Intro to
R][r-intro] lesson, such as familiarity with the R/RStudio interface, as well
as objects and functions.

We will be working through the material together in RStudio [rstudio] using the
R Notebook [r-notebook] file format. To use RStudio, you will also have to download
standalone R [here][r-install]. 

Please make sure to have `tidyverse` and `patchwork` installed:

```R
install.packages('tidyverse')
install.packages('patchwork')
```


## Lesson Overview: ##

The lesson covers:

* Creating standard plots with `ggplot2`
    * Scatter plots (with legends)
    * Line plots
    * Histograms
* Modifying themes
    * Default themes
    * The `element` family
* Faceting
* Composing multiple plots with `patchwork`
* Annotating plots
    * Model fits with `geom_smooth`
    * Adding text (e.g. model coefficients) to a plot


[data-carpentry]: https://datacarpentry.org/R-ecology-lesson/
[rcourse]: https://uoftcoders.github.io/rcourse/
[rstudio]: https://www.rstudio.com/products/rstudio/download/
[r-install]: https://cran.r-project.org/bin/
[r-intro]: https://github.com/utm-coders/studyGroup/tree/gh-pages/lessons/r/intro
[r-notebook]: https://bookdown.org/yihui/rmarkdown/notebook.html
