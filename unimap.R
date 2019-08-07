
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
library("RColorBrewer")
display.brewer.all()
display.brewer.pal(n = 10, name = 'Spectral')
brewer.pal(n = 10, name = 'Spectral')

pal <- colorFactor(palette = c("#9E0142", "#D53E4F", "#F46D43", "#FDAE61", "#FEE08B", "#E6F598", "#ABDDA4", "#66C2A5", "#3288BD", "#5E4FA2"), 
                   levels = c( "1st.C", "2nd.C", "3rd.C","4rd.C","5th.C","6th.C", "7th.C","8th.C", "9th.C", "10th.C"  ))





unicredit.m4 <- leaflet() %>% 
  
  addTiles(group = "OSM") %>% 
  addProviderTiles("CartoDB", group = "Carto") %>% 
  addProviderTiles("Esri", group = "Esri") %>% 
  addCircleMarkers(data = first.C, radius = 3, label = ~htmlEscape(COD_CAB_GEST),
                   color = ~pal(`c_I1I2Indice`), 
                   popup =  ~paste0("<br/>", "COD_CAB_GEST:",br(),
                                    COD_CAB_GEST,
                                    "</i>", 
                                    "<br/>",  "ANNOMESE:", br(),
                                    `ANNOMESE`),
                   clusterOptions = markerClusterOptions(),
                   group = "1st.C")%>% 
  
  addCircleMarkers(data = second.C , radius = 3, label = ~htmlEscape(COD_CAB_GEST),
                   color = ~pal(`c_I1I2Indice`),
                   popup =  ~paste0("<br/>", "COD_CAB_GEST:",br(),
                                    COD_CAB_GEST,
                                    "</i>", 
                                    "<br/>",  "ANNOMESE:", br(),
                                    `ANNOMESE`),
                   clusterOptions = markerClusterOptions(),
                   group = "2nd.C")  %>% 
  
  addCircleMarkers(data = third.C , radius = 3, label = ~htmlEscape(COD_CAB_GEST),
                   color = ~pal(`c_I1I2Indice`),
                   popup =  ~paste0("<br/>", "COD_CAB_GEST:",br(),
                                    COD_CAB_GEST,
                                    "</i>", 
                                    "<br/>",  "ANNOMESE:", br(),
                                    `ANNOMESE`),
                   clusterOptions = markerClusterOptions(),
                   group = "3rd.C" )  %>% 
  
  addCircleMarkers(data = forth.C , radius = 3, label = ~htmlEscape(COD_CAB_GEST),
                   color = ~pal(`c_I1I2Indice`),
                   popup =  ~paste0("<br/>", "COD_CAB_GEST:",br(),
                                    COD_CAB_GEST,
                                    "</i>", 
                                    "<br/>",  "ANNOMESE:", br(),
                                    `ANNOMESE`),
                   clusterOptions = markerClusterOptions(),
                   group = "4rd.C")  %>% 
  
  addCircleMarkers(data = fifth.C , radius = 3, label = ~htmlEscape(COD_CAB_GEST),
                   color = ~pal(`c_I1I2Indice`),
                   popup =  ~paste0("<br/>", "COD_CAB_GEST:",br(),
                                    COD_CAB_GEST,
                                    "</i>", 
                                    "<br/>",  "ANNOMESE:", br(),
                                    `ANNOMESE`),
                   clusterOptions = markerClusterOptions(),
                   group = "5th.C")  %>%
  
  addCircleMarkers(data = sixth.C  , radius = 3, label = ~htmlEscape(COD_CAB_GEST),
                   color = ~pal(`c_I1I2Indice`),
                   popup =  ~paste0("<br/>", "COD_CAB_GEST:",br(),
                                    COD_CAB_GEST,
                                    "</i>", 
                                    "<br/>",  "ANNOMESE:", br(),
                                    `ANNOMESE`),
                   clusterOptions = markerClusterOptions(),
                   group = "6th.C")  %>% 
  
  addCircleMarkers(data = seventh.C, radius = 3, label = ~htmlEscape(COD_CAB_GEST),
                   color = ~pal(`c_I1I2Indice`),
                   popup =  ~paste0("<br/>", "COD_CAB_GEST:",br(),
                                    COD_CAB_GEST,
                                    "</i>", 
                                    "<br/>",  "ANNOMESE:", br(),
                                    `ANNOMESE`),
                   clusterOptions = markerClusterOptions(),
                   group = "7th.C")  %>% 
  
  addCircleMarkers(data = eightth.C  , radius = 3, label = ~htmlEscape(COD_CAB_GEST),
                   color = ~pal(`c_I1I2Indice`),
                   popup =  ~paste0("<br/>", "COD_CAB_GEST:",br(),
                                    COD_CAB_GEST,
                                    "</i>", 
                                    "<br/>",  "ANNOMESE:", br(),
                                    `ANNOMESE`),
                   clusterOptions = markerClusterOptions(),
                   group = "8tht.C")  %>% 
  
  addCircleMarkers(data = nineth.C , radius = 3, label = ~htmlEscape(COD_CAB_GEST),
                   color = ~pal(`c_I1I2Indice`),
                   popup =  ~paste0("<br/>", "COD_CAB_GEST:",br(),
                                    COD_CAB_GEST,
                                    "</i>", 
                                    "<br/>",  "ANNOMESE:", br(),
                                    `ANNOMESE`),
                   clusterOptions = markerClusterOptions(),
                   group = "9th.C")  %>% 
  
  addCircleMarkers(data = tenth.C  , radius = 3, label = ~htmlEscape(COD_CAB_GEST),
                   color = ~pal(`c_I1I2Indice`),
                   popup =  ~paste0("<br/>", "COD_CAB_GEST:",br(),
                                    COD_CAB_GEST,
                                    "</i>", 
                                    "<br/>",  "ANNOMESE:", br(),
                                    `ANNOMESE`),
                   clusterOptions = markerClusterOptions(),
                   group = "10th.C")  %>% 

  addLayersControl(baseGroups = c("OSM", "Carto", "Esri"), 
                   overlayGroups = c("1st.C", "2nd.C", "3rd.C","4rd.C","5th.C","6th.C", "7th.C","8th.C","9th.C","10th.C")) %>% 
  setView(lat = 41.8719, lng = 12.5674, zoom = 5) 

unicredit.m4 


# Make each sector of colleges searchable 
unicredit.m4_search <- unicredit.m4  %>% 
  addSearchFeatures(
    targetGroups =  c("1st.C", "2nd.C", "3rd.C","4rd.C","5th.C","6th.C", "7th.C","8th.C","9th.C","10th.C"), 
    # Set the search zoom level to 18
    options = searchFeaturesOptions(openPopup = TRUE,zoom = 20)) 

# Try searching the map for a college
unicredit.m4_search












