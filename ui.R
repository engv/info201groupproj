library(shiny)
library(plotly)
library(DT)
source("wrangle.R")

gender_choices <- colnames(both)
gender_choices <- gender_choices[-1]

ui <- navbarPage(
  "Big 5 Personality Test",
  # tabPanel(
  #   titlePanel("25 personalities"),
  #   sidebarLayout(
  #     sidebarPanel("Select age and race",
  #       selectInput("select.x", label = "Select age")
  #     ),
  #     mainPanel(plotOutput("graph"))
  #   )
  # ),
  tabPanel(
    titlePanel("Personality Types by Age"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("age", "Select Age", min = 0, max = 100, value = 50),
        tags$p(tags$u("Personality Traits Key"),
               tags$br("E - Extraversion  / I - Introversion"),
               tags$br("A - Agreeable     / D - Disagreeable"),
               tags$br("C - Conscientious / U - Unconscientious"),
               tags$br("N - Neuroticism   / S - Secure"),
               tags$br("O - Openness      / P - Pragmatic"))
      ),
      mainPanel(
        plotOutput("age_plot")
      )
    )
  ),
  tabPanel(
    titlePanel("Personality Types by Gender"),
    sidebarLayout(
      sidebarPanel(
        selectInput("gender", "Select Gender", choices =
                      list("Female" = gender_choices[2],
                           "Male" = gender_choices[1],
                           "Both" = gender_choices[3])
        )
      ),
      mainPanel(
        plotOutput("gender_plot")
      )
    )
  ),
  tabPanel(
    titlePanel("Personality Test Data"),
    mainPanel(
        DTOutput("page_table")
    )
  ),
  
  tabPanel(
    titlePanel("Personality Test Data"),
    mainPanel(
      DTOutput("results_table")
    )
  )
)

shinyUI(ui)
