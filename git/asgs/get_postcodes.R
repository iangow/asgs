---
title: "Postcodes of Australia"
author: "Ian Gow"
date: "17/09/2017"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This code gets data from ABS on postcodes and creates an `sf` object, then plots it.

```{r download_data, echo=FALSE, cache=TRUE}
tempf <- tempfile()
url <- paste0("http://www.abs.gov.au/ausstats/subscriber.nsf/",
              "log?openagent&1270055003_poa_2016_aust_shape.zip",
              "&1270.0.55.003&Data%20",
              "Cubes&4FB811FA48EECA7ACA25802C001432D0",
              "&0&July%202016&13.09.2016&Latest")
download.file(url = url, destfile = tempf)
unzip(tempf)
```
Now read in the data.

```{r read_data, cache=TRUE, dependson="download_data"}
library(sf)
poa_2016_aust <- st_read("POA_2016_AUST.shp")
```

Now make a plot.
```{r plot_data, dependson="read_data"}
par(mar = c(0,0,1,0))
plot(poa_2016_aust[1])
```
