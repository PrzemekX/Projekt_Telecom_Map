
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

# install.packages("shiny")
# install.packages("leaflet")
# install.packages("jsonlite")

library(shiny)
library(leaflet)
library(jsonlite)

shinyServer(function(input, output) {
  
  output$mymap <- renderLeaflet({
    
    ####Radio buttons - Open#####
    Input1 <- input$Map1_1
    if(Input1[1] == 1) {
      x <- 8.223
      y <- 46.695
      z <- 6
    }
    if (Input1[1] == 2) {
      x <- 19.775
      y <- 51.713
      z <- 5
    }
    #####Radio buttons - Close#####

    #####Icon - Open#####
    # switzerland <- makeIcon(
    #   iconUrl = "https://upload.wikimedia.org/wikipedia/commons/archive/f/f3/20051012014526%21Flag_of_Switzerland.svg",
    #   iconWidth = 25, iconHeight = 25,
    #   iconAnchorX = 12, iconAnchorY = 25
    # )
    #####Icon - Close#####
    
    #####GeoJson - Open#####
    geojson <- readLines("SDane2.txt", warn = FALSE) %>%
      paste(collapse = "\n") %>%
      fromJSON(simplifyVector = FALSE)

    # Default styles for all features
    geojson$style = list(
      weight = 1,
      color = "#555555",
      opacity = 1,
      fillOpacity = 0.8
    )
    
    # Gather population estimate from all cantons
    population <- sapply(geojson$features, function(feat) {
      max(1, feat$MyData$population)
    })
    
    # Color by population using quantiles
    pal <- colorQuantile("Reds", n = 26, population)  #"Greens"
    # Add a properties$style list to each feature
    geojson$features <- lapply(geojson$features, function(feat) {
      feat$properties$style <- list(
        fillColor = pal(
          max(1, feat$MyData$population)
        )
      )
      feat
    })
    #####GeoJson - Close#####
    
    m <- leaflet() %>%
      addGeoJSON(geojson) %>%
      # addTiles() %>% #normala mapa
      addProviderTiles("Stamen.Toner") %>% #mapa toner
      # addRectangles(lng1 = 8.223, lat1 = 46.695, lng2 = 9, lat2 = 48) %>%
      # addMarkers(lng = 8.223, lat = 46.695, popup="Switzerland", icon = switzerland) %>%
      addMarkers(lng = 8.223, lat = 46.695, popup="Switzerland") %>%
      setView(lng = x, lat = y, zoom = z) #%>%
      # addTopoJSON(topoData, weight = 1, color = "#444444", fill = FALSE)
    m  # Print the map
    
  })

})