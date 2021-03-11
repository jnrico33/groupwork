shinyUI(
    dashboardPage(
        title = 'HRRC',
        header = dashboardHeader(
            titleWidth='100%',
            title = span(
                tags$img(src="www/palmdale_school_logo.png", width = '100%')
                )
            ),
            dropdownMenuOutput("helpMenu")       
        ),
        body = dashboardBody(
            # see next chunk for the CSS
        )
    )
