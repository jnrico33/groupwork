#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(tidyverse)
library(shiny)
library(shinydashboard)
library(ggthemes)

library(tidyverse)
library(shiny)
library(shinydashboard)
library(ggthemes)
attrates_long <- readr::read_csv("attrateslong.csv")

ui <- dashboardPage(skin ="black",
    dashboardHeader(title = "Attendance Data"),
    dashboardSidebar(disable = T),
    dashboardBody(
        fluidRow(
            box(title = "Plot Options", width = 3,
                selectInput("x", "Select Term", choices = c("attendance_rate_percent", "student_add", "student_drop"),
                            selected = "attendance_rate_percent"),
            ), # close the first box
            box(title = "Attendance Rates, Enrollment and Withdrawal Data by Month", width=8,
                plotOutput("plot", width = "700px", height = "500px")
            ) # close the second box
        ) # close the row
    ) # close the dashboard body
) # close the ui
server <- function(input, output, session) { 
    output$plot <- renderPlot({
        attrates_long %>% 
            filter(attendance_statistic==input$x) %>% 
            ggplot(aes(x=month, y=value)) +
            geom_col(color="black", fill="darkcyan", alpha=.5)+
            facet_wrap(~year)+
            #geom_col(color="black", fill="slateblue2", alpha=1)+
            theme_gdocs()+
            labs(x="Month",y="Count")
        
    })
    
    # stop the app when we close it
    session$onSessionEnded(stopApp)
}
shinyApp(ui, server)