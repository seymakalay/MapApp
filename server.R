



function(input, output) {
  
  
  #output$mymap <- renderLeaflet({ 
  #  unicredit.m4 #coming from unimap.R
    
  #})
  
  
  
  output$mymap <- renderLeaflet({ 
  leaflet() %>% 
    
    addTiles(group = "OSM") %>% 
    addProviderTiles("CartoDB", group = "Carto") %>% 
    addProviderTiles("Esri", group = "Esri") %>% 
    addCircleMarkers(data = first.C, radius = 4, label = ~htmlEscape(COD_CAB_GEST),
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
                     group = "8th.C")  %>% 
    
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
  

  })
  
  
  
  
  
  
  
  #ADD MARKDOWN
  
  #output$supervised.markdown <- renderUI({
  #  HTML(markdown::markdownToHTML(knit('supervised.rmd', quiet = TRUE)))
  #})
  
  # Create data table
  output$alldataset <- DT::renderDataTable({
    DT::datatable(data = ClustereData %>% select(1:46),
                  options = list(pageLength = 20), 
                  rownames = FALSE)
  })
  
  
  # display 10 rows initially
#  output$ex1 <- DT::renderDataTable(
#   DT::datatable(iris, options = list(pageLength = 25))
#  )
  
  # -1 means no pagination; the 2nd element contains menu labels
 # output$ex2 <- DT::renderDataTable(
#    DT::datatable(
 #     iris, options = list(
  #      lengthMenu = list(c(5, 15, -1), c('5', '15', 'All')),
   #     pageLength = 15
    #  )
    #)
#  )
  
  # you can also use paging = FALSE to disable pagination
 # output$ex3 <- DT::renderDataTable(
#    DT::datatable(iris, options = list(paging = FALSE))
 # )
  
  # turn off filtering (no searching boxes)
#  output$ex4 <- DT::renderDataTable(
#    DT::datatable(iris, options = list(searching = FALSE))
#  )
  
  # write literal JS code in JS()
#  output$ex5 <- DT::renderDataTable(DT::datatable(
#    iris,
#    options = list(rowCallback = DT::JS(
#      'function(row, data) {
#        // Bold cells for those >= 5 in the first column
#        if (parseFloat(data[1]) >= 5.0)
#          $("td:eq(1)", row).css("font-weight", "bold");
#      }'
#    ))
#  ))
  
  output$pivot <- renderRpivotTable({
    rpivotTable(data =   dfpivot ,  
                rows = c("DES_REGIONE_ABI_GEST") , #,"DES_PROVINCIA_ABI_GEST" for this update dfpivot
                cols="c_I1I2Indice",vals = "Freq", aggregatorName = "Count", 
                rendererName = "Table", subtotals = TRUE)#width="200%", height="600px")
    
  })
  
  # Create scatterplot object the plotOutput function is expecting
  
  output$scatterplot <- renderPlot({
    ggplot(data = ClustereData, aes_string(x = input$x, y = input$y,color=input$z,size=input$z)) +
      geom_point(alpha = input$alpha)
  })
  
  # Create densityplot
  #  output$densityplot <- renderPlot({
  #    ggplot(data = ClustereData, aes_string(x = input$xx)) +
  #      geom_density()
  #})
  
  
  # fun_args.x <- list(mean = mean(ClustereData$x), sd = sd(ClustereData$x))
  
  output$histplot.x <- renderPlot({
    ggplot(data = ClustereData, aes_string(x = input$x)) +
      geom_histogram(aes(y = ..density..),bins = 100,col="darkgreen",fill="darkgreen")+
      geom_density(alpha=.2, fill="#FF6666",col = "red")
    # stat_function(fun = dnorm ,args = fun_args.x,  col = "blue") 
    
    
    
  })
  
  #  fun_args.y <- list(mean = mean(ClustereData$y), sd = sd(ClustereData$y))
  
  output$histplot.y <- renderPlot({
    ggplot(data = ClustereData, aes_string(x= input$y)) +
      geom_histogram(aes(y = ..density..),bins = 100,col="darkgreen",fill="darkgreen")+
      geom_density(col = "red",alpha=.2, fill="#FF6666")
    # stat_function(fun = dnorm,args = fun_args.y, col = "blue") 
    
  })
  
  
  output$df.print <- renderTable ({
    ClustereData %>%
      #group_by("c_I1I2Indice")%>%
      summarise(mean.indice =round( mean(INDICE), digits = 5),
                mean.investment =round(  mean(index.oninvestment),digits = 5),
                mean.protection = round( mean(index.on.prodection),digits = 5))
  })
  
  
  
  
  output$mytable1 <- renderTable ({
    ClustereData %>%
      group_by_(input$z) %>%
      summarize(mean.Indice = round( mean(INDICE), digits = 5), 
                mean.Index.on.Investment=round(  mean(index.oninvestment), digits = 5), 
                mean.Index.on.Protection = round( mean(index.on.prodection), digits = 5)) %>%
      arrange(desc(mean.Indice))    
  })
  
  
  
  
  output$pivot <- renderRpivotTable({
    rpivotTable(data =   dfpivot ,  
                rows = c("DES_REGIONE_ABI_GEST") , #,"DES_PROVINCIA_ABI_GEST" for this update dfpivot
                cols="c_I1I2Indice",vals = "Freq", aggregatorName = "Count", 
                rendererName = "Table", subtotals = TRUE)#width="200%", height="600px")
    
  })
  
  
  output$mytable = DT::renderDataTable({
    DT::datatable(data= ClustedMean, options = list(pageLength = 11))
    
  }) 
  
  
  # Create data table
  output$alldataset <- DT::renderDataTable({
    DT::datatable(data = ClustereData %>% select(1:46),
                  options = list(pageLength = 20), 
                  rownames = FALSE)
  })
  
  
  # Create text output stating the correlation between the two ploted 
  output$correlation <- renderText({
    r <- round(cor(ClustereData[, input$x], ClustereData[, input$y], use = "pairwise"), 3)
    paste0("Correlation = ", r, ". Note: If the relationship between the two variables is not linear,
             the correlation coefficient will not be meaningful.")
  })
  
  
  
  # Print data table
  output$moviestable <- DT::renderDataTable({
    brushedPoints(ClustereData,input$plot_brush)%>%
      # nearPoints(ClustereData, coordinfo = input$plot_hover) %>% 
      select(COD_CAB_GEST, REGIONE ,DES_REGIONE_ABI_GEST,DES_PROVINCIA_ABI_GEST, c_I1I2Indice)
  })
  
  # Download file
  output$download_data <- downloadHandler(
    filename = function() {
      paste0("ClustereData.", input$filetype)
    },
    content = function(file) { 
      if(input$filetype == "csv"){ 
        write_csv(ClustereData %>% select(input$selected_var), path = file) 
      }
      if(input$filetype == "tsv"){ 
        write_tsv(ClustereData %>% select(input$selected_var), path = file) 
      }
    }
  )
  
  
  # Download file Selected Graf
 # output$download_data1 <- downloadHandler(
#    filename = function() {
 #     paste0("selecteddata.", input$filetype)
#    },
#    content = function(file) { 
#      if(input$filetype == "csv"){ 
#        write_csv(moviestable %>% select(input$plot_brush)  , path = file) 
#      }
#      if(input$filetype == "tsv"){ 
#        write_tsv(moviestable %>% select(input$plot_brush), path = file) 
#      }
#    }
#  )
  
  output$moviestable <- DT::renderDataTable({
    brushedPoints(ClustereData,input$plot_brush)%>%
      # nearPoints(ClustereData, coordinfo = input$plot_hover) %>% 
      select(COD_CAB_GEST, REGIONE ,DES_REGIONE_ABI_GEST,DES_PROVINCIA_ABI_GEST, c_I1I2Indice)
  })
  
  
  
  

  
  
}
 