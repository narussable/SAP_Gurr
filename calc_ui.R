shivers <- function(){
    box(
        title = 'Caracteristicas de Bomba',
        width = 12,
        fluidRow(
            column(
                width = 6,
                title = 'Input Vars',
                
                box(
                    title = 'Input Variables',
                    width = 12,
                    pozo(),
                    fluid(),
                    voltage(),
                    fluent(),
                    special(),
                    shiny::actionButton(
                        inputId = 'start_but',
                        label = 'Calcular',
                        icon = icon('calculator')
                    )
                )
            ),
            column(
                width = 6,
                
                box(
                    title = 'Calculos',
                    width = 12,
                    useShinyalert(),
                    box(
                        title = 'Seccion 1',
                        collapsed = TRUE,
                        width = 12,
                        DT::dataTableOutput('sec1')
                    ),
                    
                    box(
                        title = 'Propiedad de los Fluidos',
                        width = 12,
                        collapsed = TRUE,
                        useShinyalert(),
                        DT::dataTableOutput('flu')
                    ),
                    
                    box(
                        title = 'Seccion 2',
                        width = 12,
                        collapsed = TRUE,
                        useShinyalert(),
                        DT::dataTableOutput('sec2')
                    ),
                    
                    box(
                        title = 'Seccion 3',
                        width = 12,
                        collapsed = TRUE,
                        useShinyalert(),
                        DT::dataTableOutput('sec3')
                    )
                )
            )
        )
    )
}

shivers2 <- function(){
    box(
        title = 'Carga Dinamica',
        width = 12,
        height = '740px',
        fluidRow(
            conditionalPanel(
                condition = "input.start_but>1",
                verbatimTextOutput('ldyn')
            ),
            column( 8, plotOutput('grph1') )
        )
    )
}