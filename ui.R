# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(leaflet)

shinyUI(fluidPage(
  leafletOutput("mymap"),
  
  radioButtons("Map1_1", label = h3("Wyb kraju"),
               choices = list("Szwajcaria" = 1, "Polska" = 2),
               selected = 1)
                 
))
