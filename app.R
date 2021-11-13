library(bs4Dash)

source('blockSteps.R')

ui <- dashboardPage(
    dashboardHeader(title = "Segundo programa"),
    dashboardSidebar(collapsed = TRUE),
    dashboardBody(
        fluidRow(
            column(
                width = 6,
                box(
                    title = 'Input Varibles',
                    width = 12,
                    pozoBlock(),
                    fluidBlock(),
                    fluentBlock()
                )
            )
        )
    )
)

server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)
    
    output$plot1 <- renderPlot({
        data <- histdata[seq_len(input$slider)]
        hist(data)
    })
}

shinyApp(ui, server)