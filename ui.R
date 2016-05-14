# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(leaflet)

#####Choices for drop-downs#####OPEN#####
vars <- c(
  "Normal Map" = "normalmap",
  "Population Map" = "populationmap"#,
  #"College education" = "college",
)
vars2 <- c(
  "Normal Tile" = "normaltile",
  "Toner Tile" = "tonertile",
  "Positron Tile" = "positrontile"
)
#####Choices for drop-downs#####CLOSE#####

shinyUI(navbarPage("Dane Telecom", #id="nav",
  #####TabPanel####Interactive Map#####Open#####
  tabPanel("Interactive map",
    # div(class="outer",
    leafletOutput("mymap", width = "100%", height = 600),
  
    ###Map Panel - OPEN###
    absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                  draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
                  width = 350, height = "auto",
                
    h2("Panel mapy"),
    
    selectInput("choosemap", "Wybór mapy", vars),
    selectInput("choosetile", "Rodzaj mapy", vars2)
    
    # plotOutput("Plot1")
    ),
    ###Map Panel - CLOSE###

    tags$head(
      # Include our custom CSS
      includeCSS("styles.css")
    )
  ),
  #####TabPanel####Interactive Map#####Close#####
  
  #####TabPanel####Plots#####Open#####
  tabPanel("Plots",
    plotOutput("Plot1")
  )
  #####TabPanel####Plots#####Close#####
                 
))
