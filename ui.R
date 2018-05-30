library(shiny)
library(plotly)


shinyUI(navbarPage(
  "Big 5",
  tabPanel(
    titlePanel("25 personalities"),
    sidebarLayout(sidebarPanel("Select age and race",
      selectInput("select.x",
                  label = "Select age"
        mainPanel("Comparison Graph" , style = "color: gray",
                  plotlyOutput("graph")))
    )
    )
  )
)
)