library(shiny)
library(shinydashboard)

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
