---
layout: page
title: 'Intro to data visualization with ggplot2'
visible: true
tags:
  - r
  - beginner
---

 - **Authors**: Ahmed Hasan and James Santangelo, borrowing heavily from Joel Ostblom
 - **Research field**: Biology
 - **Lesson topic**: Data visualization in R with `ggplot2`
 - **Lesson content URL**: <https://github.com/utm-coders/studyGroup/tree/gh-pages/lessons/r/ggplot2>

## Preface: ##

This is an introduction to data visualization in R with the `ggplot2` package.
It is based partially on openly available material from [Data
Carpentry][data-carpentry] and [EEB313][rcourse]. This lesson covers most
standard kinds of plots used in biological research, such as scatter plots,
line plots, bar plots, and histograms. The latter half of the lesson addresses
intermediate-level techniques in `ggplot2`, such as facetting and model
fitting.  Finally, the lesson touches on plot customization using themes.

The lesson assumes knowledge of the material covered in our [Intro to
R][r-intro] lesson, such as familiarity with the R/RStudio interface, objects
and functions, as well as some basic `dplyr` operations.

We will be working through the material together in RStudio [rstudio] using the
R Notebook [r-notebook] file format. To use RStudio, you will also have to download
standalone R [here][r-install]. 

Please make sure to have `dplyr`, `readr`, `knitr`, and `ggplot2` installed:

```R
install.packages('dplyr')
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

* Creating standard plots with `ggplot2`
    * Scatter plots
    * Line plots
    * Histograms
    * Bar plots
    * Box plots
* Model fits with `geom_smooth`.
* Setting universal plot settings.
* Faceting
* Plot appearance customization


[data-carpentry]: https://datacarpentry.org/R-ecology-lesson/
[rcourse]: https://uoftcoders.github.io/rcourse/
[rstudio]: https://www.rstudio.com/products/rstudio/download/
[r-install]: https://cran.r-project.org/bin/
[r-intro]: https://github.com/utm-coders/studyGroup/tree/gh-pages/lessons/r/intro
[r-notebook]: https://bookdown.org/yihui/rmarkdown/notebook.html
