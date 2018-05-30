library("dplyr")
library("plotly")
library("ggplot2")
source("analysis.R")
source("wrangle.R")

shinyServer(function(input, output) {
  output$graph <- renderPlotly({
    graph.personalities(personalities, input$select.x, input$select.y)
  })
})

