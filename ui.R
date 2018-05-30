library(shiny)
library(plotly)
source("wrangle.R")

gender_choices <- colnames(both)
gender_choices <- gender_choices[-1]

ui <- fluidPage(navbarPage(
  
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
    titlePanel("Introduction to the Big 5 Personalities"),
    mainPanel(tags$p("
Big five personality traits: often shaped by our environment and biological traits— products of nature and nuture!
                     Keep in mind that these dimensions represent general groupings of characteristics and not necessarily indicative of all people and all situations."), 
                     
                     tags$p(tags$strong("Openness - Pragmatic")),
                     tags$p("Openness refers to exploring a range of interests and having a strong and an abstract imagination.
                             They are often seen as adventurous and creative. 
On the opposite side of the spectrum, more pragmatic individuals are more comfortable with traditional means and struggle with theoretical thinking."),
                     
                     tags$p(tags$strong("Conscientious - Unconscientious")),
              tags$p("This trait features those who are have a strong level of awareness and check their impulse control with goal-oriented behaviors. Also tend to have strong organizational skills. 
                     On the opposite hand, those who express lower amounts of this trait dislike structured schedules and tend to procrastinate."),
                     
                     tags$p(tags$strong("Extraversion - Introversion")),
              tags$p("The main characteristics of extraversion, include a strong amount of emotional expressiveness and are high in sociability, assertiveness and excitablility. 
Those who are more introverted prefer solitude, dislike small talk and feel exhausted after socializing a lot."),
                     
                     tags$p(tags$strong("Agreeable - Disagreeable")),
              tags$p("This personality dimension looks at trust, kindness and affection, and strongly cooperative. 
On the opposite end, are those who tend to be competitive and some times manipulative."),
                     
                     tags$p(tags$strong("Neuroticism - Secure")),
                     tags$p("Neuroticism is characterized by emotional stability; moodiness and anxiety and irritability. Those who are low in this trait are more stable, relaxed and emotionally resilient."))
  ),
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
        ), tags$p(tags$u("Personality Traits Key"),
                  tags$br("E - Extraversion  / I - Introversion"),
                  tags$br("A - Agreeable     / D - Disagreeable"),
                  tags$br("C - Conscientious / U - Unconscientious"),
                  tags$br("N - Neuroticism   / S - Secure"),
                  tags$br("O - Openness      / P - Pragmatic"))
        
      ),
      mainPanel(
        plotOutput("gender_plot")
      )
    )
  )
))

shinyUI(ui)
