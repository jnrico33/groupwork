library(shiny)
library(shinydashboard)
library(tidyverse)
library(ggthemes)
library(shinythemes)
attrates_long <- readr::read_csv("attrateslong.csv")
gpa_2_long <- readr::read_csv("gpa_2_long.csv")


sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Victim", tabName = "victim"),
    menuItem("Trafficker", tabName = "trafficker")
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "victim",
            h2("Victim tab")
    ),
    
    tabItem(tabName = "trafficker",
            h2("Trafficker tab")
    )
  )
)

shinyApp(
  ui = dashboardPage(
    dashboardHeader(title = "Human Trafficking"),
    sidebar,
    body
  ),
  server = function(input, output) { }
)

