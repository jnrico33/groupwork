#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
gpa_2_long <- readr::read_csv("gpa_2_long.csv")

ui <- dashboardPage(
    dashboardHeader(title = "GPA Shiny App"),
    dashboardSidebar(disable = T),
    dashboardBody(
        fluidRow(
            box(title = "Plot Options", width = 2,
                radioButtons("x", "Select Grade", choices = c("6", "7", "8"), 
                             selected = "6"),
                radioButtons("y", "Select Term", choices = c("1", "2"),
                             selected = "1"),
                radioButtons("z", "Select Year", choices = c("2019", "2020"),
                             selected = "2019"),
            ), # close the first box
            box(title = "GPA Data From Years 19-20 and 20-21", width=8,
                plotOutput("plot", width = "700px", height = "500px")
            ) # close the second box
        ) # close the row
    ) # close the dashboard body
) # close the ui

server <- function(input, output, session) { 
    
    output$plot <- renderPlot({
        gpa_2_long %>% 
            filter(grade==input$x & term==input$y & year==input$z) %>% 
            ggplot(aes(x=gpa, fill=year)) +
            geom_histogram(color="black", fill="darkcyan", alpha=.5)+
            theme_gdocs()+
            labs(x="GPA", y="Student Count")
        
    })
    
    # stop the app when we close it
    session$onSessionEnded(stopApp)
}

shinyApp(ui, server)
