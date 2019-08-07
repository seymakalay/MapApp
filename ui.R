

navbarPage(
  title = 'Benvenuto',
  tabPanel('read.me', column(3,
           
           h3("Welcome to Interactive User Interface"),
           
           tags$a( "Copy Rights belong to Unicredit.it", href="https://www.unicredit.it/it/privati.html"),
           h3("Map Tab"),
           
           h4("Please select your criteria from the dropdown menu on the top right."),
           h4("To see the popup zoom.in and click on the point and to see the world map zoom.out."),
           #h4("To see the world map zoom.out."),
           h4("In the dataset many adresses were not able to be converted to its cordinates so we only considered the cities cordinates with a bit noise."),
           
           h3("APP4 Tab"),
           h4("To see the summary statistics of the Map Tab."),
           h3("Reports Tab"),
           h4("Check the results of supervised and unsupervised studies."),
           
           h3("Contact"), 
           tags$a("Contact with the App Builder", href="http://www00.unibg.it/struttura/strutturasmst.asp?id_notizia=81930"),
           br(),
           tags$a("See other Github repositories", href="https://github.com/seymakalay"),br(),br(),
           
           h6("Built with ",
              img(src = "https://www.rstudio.com/wp-content/uploads/2014/04/shiny.png", height = "30px"),
              "by",
              img(src = "https://www.rstudio.com/wp-content/uploads/2014/07/RStudio-Logo-Blue-Gray.png", height = "30px"),
              ".")
           
           )), # one of the )  is the close  column(5,
     
  
  tabPanel('map', leafletOutput("mymap",width="100%", height = 950 )),  # height = "500px"

                 tabPanel(title = "APP4", 
                          sidebarPanel( width = 2,   selectInput(inputId = "y", 
                                      label = "Y-axis:",
                                      choices = c("index.oninvestment", "index.on.prodection", "INDICE"), 
                                      selected = "INDICE"),
                          
                          # Select variable for x-axis
                          selectInput(inputId = "x", 
                                      label = "X-axis:",
                                      choices = names(ClustereData[,-c(1:6,18:21,44:46)]),
                                      selected = "RISERVA_MATEMATICA_201711"),
                    
                          # Select variable for color
                          selectInput(inputId = "z", 
                                      label = "Color by:",
                                      choices = c("DES_REGIONE_ABI_GEST" = "DES_REGIONE_ABI_GEST", 
                                                  "DES_PROVINCIA_ABI_GEST" = "DES_PROVINCIA_ABI_GEST", 
                                                  #"FLAG_RECESSO_2017" = "FLAG_RECESSO_2017", 
                                                  "c_I1I2Indice" = "c_I1I2Indice"),
                                      selected = "c_I1I2Indice"),
                          # Set alpha level
                          sliderInput(inputId = "alpha", 
                                      label = "Alpha:", 
                                      min = 0, max = 1, 
                                      value = 0.3),
                        
                          # Select filetype
                          radioButtons(inputId = "filetype",
                                       label = "Select filetype:",
                                       choices = c("csv", "tsv"),
                                       selected = "csv"),
                          
                          
                          # Select variables to download
                          checkboxGroupInput(inputId = "selected_var",
                                             label = "Select variables:",
                                             choices = names(ClustereData),
                                             selected = c(2:6,18,43:46))
                         
                            ), #close sidebarPanel
                
                          
                          mainPanel( width = 9,
                                     tabsetPanel(type = "tabs",
                                                 # Tab 1: Plot
                                                 tabPanel(title = "Plot", 
                                                 br(),h4("Visualize Custom Plot"),
                                                 h5("Choose an option from Color by on the left and select points on the graph with left click to see the selected values under the graph with its correlation."),br(),
                                                 plotOutput(outputId = "scatterplot", brush = "plot_brush"), 
                                                 
                                                 textOutput(outputId = "correlation"),
                                                 br(),
                                                 h4("Visualize the Selected Points "), br(),
                                                 DT::dataTableOutput(outputId = "moviestable"),
               
                                                 h4("Histogram of Xs"), 
                                                 plotOutput(outputId = "histplot.x", height = 150),
                                                 h4("Histogram of Ys"), 
                                                 plotOutput(outputId = "histplot.y", height = 150)
                                      
                                                 ), #close tabPanel(title = "Plot"  
                                                
                                          
                                                 # Tab 2: Data
                                                 tabPanel(title = "Summary", 
                                                          br(),
                                                          h4("Mean Values Based on Color by option"),
                                                          h5("Choose an option from Color by. Higher the Deviation From the Mean of the Values Dangerous the Cluster is"),
                                                          h5("In This Case Cluster 1 and 4 Seems the Most Dangerous Clusters -> INSPECT"),
                                                          
                                                          #DT::dataTableOutput("mytable"),
                                                          
                                                          tableOutput(outputId="mytable1" ),
                                                          #bunu ekledim
                                                          
                                                          tableOutput(outputId="df.print")
                                                 ), #close tabPanel(title = "Summary"
                                                 
                                                 
                                                 # Tab 3: Data
                                                 tabPanel(title = "Table", 
                                                          br(),
                                                          
                                                          h4("Interactive Table"), 
                                                          h5("Recomendend: Table with Sub Total Col Heat map (or Bar Chart) and Count"),
                                                          h5("Recomendend: Changing the Place of DES_Regione, DES_Proviancia, Regione and c_I1I2Indice"),
                                                          rpivotTableOutput("pivot")
                                                          
                                                 ), #close tabPanel(title = "Table"
                                                 
                                                 # Tab 4: Data
                                                 tabPanel(title = "Data", 
                                                          br(),
                                                          
                                                          tags$a(" Visualize Your Data Table", href="https://seymakalay87.shinyapps.io/app5/"),br(),
                                                          br(),
                                                          #DT::dataTableOutput( "alldataset"),
                                                          DT::dataTableOutput( "alldataset"),
                                                          
                                                          HTML("Select filetype and variables, then click"), downloadButton("download_data", "Download data"),
                                                          br()
                                                          
                                                          
                                                          
                                                          
                                                          
                                                          # DT::dataTableOutput(data= ClustereData %>% select(c(2:6),19:21,43:46),
                                                          #              options = list(pageLength = 50)
                                                          #DT::dataTableOutput(outputId = "moviestable")
                                                          
                                                 ) #close tabPanel(title = "Data"
                                                 
                                                 
                               
                                                            
          
                           ) # close tabsetPanel
                           ) # close mainPanel 
                           ),# close tabPanel APP4
                                               
                                    
                                               

  

  

  
  #tabPanel('Display length',     DT::dataTableOutput('ex1')),
  #tabPanel('Length menu',        DT::dataTableOutput('ex2')),
  #tabPanel('No pagination',      DT::dataTableOutput('ex3')),
  #tabPanel('No filtering',       DT::dataTableOutput('ex4')),
  #tabPanel('Function callback',  DT::dataTableOutput('ex5'))

# , #PUT , OR )


navbarMenu("Reports",
           
           #add conditionalPanel here with respective tabs
           conditionalPanel(
             'input.navbar == "Supervised learning"||input.navbar == "Unsupervised learning"'      #||input.navbar == "Error Insight"'  #,
             #selectInput("variable", "Variable:", c("a","b","c"))
 
           
           ),  
       
           tabPanel("Supervised learning", column(8,
                                                  
                                          includeMarkdown("supervised.md")),   
                                                  #uiOutput("supervised.md")),
                    tags$br()
                    
           ),
           
           tabPanel("Unsupervised learning",column(8,
                                                  
                                                  includeMarkdown("unsupervised.md")),
                    

                    tags$br()
           )
           #,
           #tabPanel("Error Insight", tags$br()
                    
           #)
           
           
           
           
),

#tabPanel("About",tags$br()), 

#id for navbarPage           
id="navbar" )



      








              
                  

 


