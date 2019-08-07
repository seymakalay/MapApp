
library(markdown);library(ggplot2);library(labeling);library(DT);library(tools)
library(stringr); library(shiny);library(rpivotTable);library(readr)
library(leaflet); library(leaflet.extras);library(knitr);library(maps)
library(dplyr); library(readxl);library(sp);library(shp2graph)
library(htmltools); library(htmlwidgets)


ClustereData <- read_excel("ClustereData.xlsx")



ClustereData$lat <- jitter(ClustereData$lat )
ClustereData$lng <- jitter(ClustereData$lng )






ClustereData <- read_excel("ClustereData.xlsx")
#ClustedMean <- read_excel("ClustedMean.xlsx")
clustedmean1row <-read_excel("df.xlsx")
na.omit(ClustereData)
attach(ClustereData)
str(ClustereData)

#ClustereData$c_I1I2Indice <- as.factor(c_I1I2Indice)
dfpivot <- ClustereData[,c("DES_REGIONE_ABI_GEST","c_I1I2Indice","DES_PROVINCIA_ABI_GEST","REGIONE" )]





library(readxl)
ClustereData <- read_excel("ClustereData.xlsx")

# Create data frame
first.C <- dplyr::filter(ClustereData, c_I1I2Indice ==  "1st.C")  
second.C <- dplyr::filter(ClustereData, c_I1I2Indice ==  "2nd.C")  
third.C <- dplyr::filter(ClustereData, c_I1I2Indice ==  "3rd.C")  
forth.C <- dplyr::filter(ClustereData, c_I1I2Indice ==  "4rd.C")  
fifth.C <- dplyr::filter(ClustereData, c_I1I2Indice ==  "5th.C")  

sixth.C <- dplyr::filter(ClustereData, c_I1I2Indice ==  "6th.C")  
seventh.C <- dplyr::filter(ClustereData, c_I1I2Indice ==  "7th.C")  
eightth.C <- dplyr::filter(ClustereData, c_I1I2Indice ==  "8th.C")  
nineth.C <- dplyr::filter(ClustereData, c_I1I2Indice ==  "9th.C")  
tenth.C <- dplyr::filter(ClustereData, c_I1I2Indice ==  "10th.C" )  


####
####
####

pal <- colorFactor(palette = c("#9E0142", "#D53E4F", "#F46D43", "#FDAE61", "#FEE08B", "#E6F598", "#ABDDA4", "#66C2A5", "#3288BD", "#5E4FA2"), 
                   levels = c( "1st.C", "2nd.C", "3rd.C","4rd.C","5th.C","6th.C", "7th.C","8th.C", "9th.C", "10th.C"  ))
  



                   