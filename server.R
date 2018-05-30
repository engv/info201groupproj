library(dplyr)
library(plotly)
library(ggplot2)
library(DT)
source("wrangle.R")

server <- function(input, output) {
  output$age_plot <- renderPlot({
    age_data <- filter(personalities_results, age <= input$age)
    ggplot(age_data, aes(x = traits, y = age, color = age)) +
      geom_point(position = position_jitter(w = 0.3, h = 0.3)) +
      xlab("Personality Traits") + ylab("Age") +
      theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
      ggtitle("What Personality Types Are Common Among Different Age Groups?")
  })
  
  output$gender_plot <- renderPlot({
    treemap(both, index = "traits", vSize = toString(input$gender),
            type = "index", position.legend = "right",
            title.legend = "32 Personality Types",
            title = "Distribution of Personalities by Gender",
            fontsize.labels = 10)
  })
}

shinyServer(server)