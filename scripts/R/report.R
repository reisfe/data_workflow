#' ---
#' title: "My Report"
#' author: "Fernando Reis"
#' date: "27 de agosto de 2016"
#' output: html_document
#' ---

#+ setup, include=FALSE
knitr::opts_chunk$set(echo = TRUE)

#' ## R Markdown
#' 
#' This is an R Markdown document. Markdown is a simple formatting syntax for
#' authoring HTML, PDF, and MS Word documents. For more details on using R
#' Markdown see <http://rmarkdown.rstudio.com>.
#' 
#' When you click the **Knit** button a document will be generated that includes
#' both content as well as the output of any embedded R code chunks within the
#' document. You can embed an R code chunk like this:

#+ globals
source(file.path("scripts", "R", "globals.R"))

#+ packages
library(feather)

#+ cars
data <- read_feather(file.path(TIDY_DATA_DIR, "mtcars.feather"))
summary(data)
	
#' ## Including Plots	
#' 	
#' You can also embed plots, look at an example:	

#+ pressure, echo=FALSE	
plot(data$pressure)

#' Note that the `echo = FALSE` parameter was added to the code chunk to prevent
#' printing of the R code that generated the plot.
