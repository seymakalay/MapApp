library(shiny);library(ggplot2);library(readxl);
library(dplyr);library(labeling)
library(DT);library(rpivotTable);library(readr)
library(stringr);library(tools)
ClustereData <- read_excel("ClustereData.xlsx")
#ClustedMean <- read_excel("ClustedMean.xlsx")
clustedmean1row <-read_excel("df.xlsx")
na.omit(ClustereData)
attach(ClustereData)
str(ClustereData)


shinyApp(ui, server)


