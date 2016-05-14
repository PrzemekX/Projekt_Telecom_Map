
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

# install.packages("shiny")
# install.packages("leaflet")
# install.packages("jsonlite")
# install.packages("ggplot2")
# install.packages("xlsx")

library(xlsx)
library(shiny)
library(leaflet)
library(jsonlite)
library(ggplot2)

shinyServer(function(input, output) {
  
  output$mymap <- renderLeaflet({

    ###Inne - OPEN###
    ###Inne - CLOSE###

    ####Radio buttons - Open#####
    x <- 8.223
    y <- 46.695
    z <- 6

    # Input1 <- input$Map1_1
    # if(Input1[1] == 1) {
    #   x <- 8.223
    #   y <- 46.695
    #   z <- 6
    # }
    # if (Input1[1] == 2) {
    #   x <- 19.775
    #   y <- 51.713
    #   z <- 5
    # }
    #####Radio buttons - Close#####

    #####Icon - Open#####
    switzerland <- makeIcon(
      iconUrl = "flagimg//Switzerland.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    uri <- makeIcon(
      iconUrl = "flagimg//Uri.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    schwyz <- makeIcon(
      iconUrl = "flagimg//Schwyz.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    obwalden <- makeIcon(
      iconUrl = "flagimg//Obwalden.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    nidwalden <- makeIcon(
      iconUrl = "flagimg//Nidwalden.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    lucerne <- makeIcon(
      iconUrl = "flagimg//Lucerne.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    zurich <- makeIcon(
      iconUrl = "flagimg//Zurich.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    glarus <- makeIcon(
      iconUrl = "flagimg//Glarus.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    zug <- makeIcon(
      iconUrl = "flagimg//Zug.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    bern <- makeIcon(
      iconUrl = "flagimg//Bern.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    fribourg <- makeIcon(
      iconUrl = "flagimg//Fribourg.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    solothurn <- makeIcon(
      iconUrl = "flagimg//Solothurn.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    basel <- makeIcon(
      iconUrl = "flagimg//Basel.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    basel_land <- makeIcon(
      iconUrl = "flagimg//Basel_Land.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    schaffhausen <- makeIcon(
      iconUrl = "flagimg//Schaffhausen.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    appenzell_ausserrhoden <- makeIcon(
      iconUrl = "flagimg//Appenzell_Ausserrhoden.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    appenzell_innerrhoden <- makeIcon(
      iconUrl = "flagimg//Appenzell_Innerrhoden.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    sankt_gallen <- makeIcon(
      iconUrl = "flagimg//Sankt_Gallen.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    graubunden <- makeIcon(
      iconUrl = "flagimg//Graubunden.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    aargau <- makeIcon(
      iconUrl = "flagimg//Aargau.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    thurgau <- makeIcon(
      iconUrl = "flagimg//Thurgau.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    tessin <- makeIcon(
      iconUrl = "flagimg//Tessin.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    vaud <- makeIcon(
      iconUrl = "flagimg//Vaud.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    valais <- makeIcon(
      iconUrl = "flagimg//Valais.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    neuchatel <- makeIcon(
      iconUrl = "flagimg//Neuchatel.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    geneva <- makeIcon(
      iconUrl = "flagimg//Geneva.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    jura <- makeIcon(
      iconUrl = "flagimg//Jura.png",
      iconWidth = 25, iconHeight = 25,
      iconAnchorX = 12, iconAnchorY = 25
    )
    #####Icon - Close#####

    ChooseMaps <- input$choosemap
    #####GeoJson - Open#####
    geojson <- readLines("SDane2.txt", warn = FALSE) %>%
      paste(collapse = "\n") %>%
      fromJSON(simplifyVector = FALSE)

    # # Default styles for all features
    if(ChooseMaps == "normalmap") {
      geojson$style = list(
        weight = 2,
        color = "#000000",
        # opacity = 0,
        fillOpacity = 0.5
      )
    } else {
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
    }
    #####GeoJson - Close#####

    m <- leaflet() %>%
      addGeoJSON(geojson) %>%
      # addTiles() %>% #normala mapa
      # addProviderTiles("Stamen.Toner") %>% #mapa toner
      # addRectangles(lng1 = 8.223, lat1 = 46.695, lng2 = 9, lat2 = 48) %>%
      # addMarkers(lng = 8.223, lat = 46.695, popup="Switzerland", icon = switzerland) %>%

      ###Add layers as overlayGroup###
      addMarkers(lng = 8.223, lat = 46.695, popup="Switzerland", group="Countries Flag", icon = switzerland) %>%
      addMarkers(lng = 8.6778, lat = 46.7606, popup = "Uri", group="Cantons", icon = uri) %>%
      addMarkers(lng = 8.6971, lat = 47.0542, popup = "Schwyz", group="Cantons", icon = schwyz) %>%
      addMarkers(lng = 8.2099, lat = 46.8588, popup = "Obwalden", group="Cantons", icon = obwalden) %>%
      addMarkers(lng = 8.3963, lat = 46.8959, popup = "Nidwalden", group="Cantons", icon = nidwalden) %>%
      addMarkers(lng = 8.0035, lat = 47.0318, popup = "Lucerne", group="Cantons", icon = lucerne) %>%
      addMarkers(lng = 8.5367, lat = 47.3774, popup = "Zurich", group="Cantons", icon = zurich) %>%
      addMarkers(lng = 9.0619, lat = 46.9856, popup = "Glarus", group="Cantons", icon = glarus) %>%
      addMarkers(lng = 8.5480, lat = 47.1648, popup = "Zug", group="Cantons", icon = zug) %>%
      addMarkers(lng = 7.6583, lat = 46.8383, popup = "Bern", group="Cantons", icon = bern) %>%
      addMarkers(lng = 7.1598, lat = 46.8032, popup = "Fribourg", group="Cantons", icon = fribourg) %>%
      addMarkers(lng = 7.6859, lat = 47.2890, popup = "Solothurn", group="Cantons", icon = solothurn) %>%
      addMarkers(lng = 7.5944, lat = 47.5546, popup = "Basel", group="Cantons", icon = basel) %>%
      addMarkers(lng = 7.6436, lat = 47.4512, popup = "Basel Land", group="Cantons", icon = basel_land) %>%
      addMarkers(lng = 8.6404, lat = 47.6806, popup = "Schaffhausen", group="Cantons", icon = schaffhausen) %>%
      addMarkers(lng = 9.4110, lat = 47.3582, popup = "Appenzell Ausserrhoden", group="Cantons", icon = appenzell_ausserrhoden) %>%
      addMarkers(lng = 9.4640, lat = 47.3388, popup = "Appenzell Innerrhoden", group="Cantons", icon = appenzell_innerrhoden) %>%
      addMarkers(lng = 9.3634, lat = 47.4241, popup = "Sankt Gallen", group="Cantons", icon = sankt_gallen) %>%
      addMarkers(lng = 9.5718, lat = 46.6193, popup = "Graubunden", group="Cantons", icon = graubunden) %>%
      addMarkers(lng = 8.0843, lat = 47.3799, popup = "Aargau", group="Cantons", icon = aargau) %>%
      addMarkers(lng = 9.0857, lat = 47.5357, popup = "Thurgau", group="Cantons", icon = thurgau) %>%
      addMarkers(lng = 8.7709, lat = 46.2268, popup = "Tessin", group="Cantons", icon = tessin) %>%
      addMarkers(lng = 6.6565, lat = 46.5884, popup = "Vaud", group="Cantons", icon = vaud) %>%
      addMarkers(lng = 7.6245, lat = 46.2577, popup = "Valais", group="Cantons", icon = valais) %>%
      addMarkers(lng = 6.9427, lat = 47.0210, popup = "Neuchatel", group="Cantons", icon = neuchatel) %>%
      addMarkers(lng = 6.1430, lat = 46.2048, popup = "Geneva", group="Cantons", icon = geneva) %>%
      addMarkers(lng = 7.1996, lat = 47.3277, popup = "Jura", group="Cantons", icon = jura) %>%
      ###Add layers as overlayGroup - Close###
      ###Panel###
      addLayersControl(
        overlayGroups = c("Countries Flag", "Cantons"),
        options = layersControlOptions(collapsed = FALSE)
      ) #%>%
      
    ChooseTiles <- input$choosetile
    if(ChooseTiles == "normaltile") {
      m %>% clearTiles() %>% addTiles()
    } else if(ChooseTiles == "tonertile") {
      m %>% clearTiles() %>% addProviderTiles("Stamen.Toner")
    } else if(ChooseTiles == "positrontile") {
      m %>% clearTiles() %>% addProviderTiles("CartoDB.Positron")
    }
  })
    
  output$Plot1 <- renderPlot({
    
    dataFromExcel <- read.xlsx(file="Dane_Szwajcaria_Wiek3.xlsx", sheetIndex=1,header=TRUE)
    df <- dataFromExcel
    
    # df$Date <- as.Date(as.character(df$Date), format="%Y-%m-%d")
    x <- df$Time # first column with Date
    y <- df[ , 2:length(df)] # (all columns from df without the first one, the first column was x = Date)
    plotGgplot <- ggplot() +
      geom_line(data = df, aes(x = x, y = y$PopTotal, color=" Total population "), linetype = 2, size = 1.6) +
      geom_line(data = df, aes(x = x, y = y$PopMale, color=" Male "), linetype = 2, size = 1.6) +
      geom_line(data = df, aes(x = x, y = y$PopFemale, color=" Female "), linetype = 2, size = 1.6) +
      ylab('Population') +
      xlab('Year') +
      # scale_x_continuous(labels = comma) +
      scale_y_continuous ( breaks = seq(from=0,to=15000000,by=1000000)) +
      ggtitle("Switzerland population in 1950-2099") +
      theme(plot.title=element_text(size=8, face="bold",
                                    hjust = 0.5),
            axis.title=element_text(size=8))
    plotGgplot
    
  })
})