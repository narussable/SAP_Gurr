library(bs4Dash)
library(shiny)

pozo <- function(){
    box(
        title = 'Datos de Pozo',
        width = 12,
        collapsed = TRUE,
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'ditr',
                    label = 'DITR: ',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'ditp',
                    label = 'DITP: ',
                    value = NULL
                )
            )
        ),
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'phitp',
                    label = 'Phi_TP: ',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'profperf',
                    label = 'Profundidad de Perf.: ',
                    value = NULL
                )
            )
        ),
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'profbomb',
                    label = 'Profundidad de Bomba: ',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'ple',
                    label = 'Ple: ',
                    value = NULL
                )
            )
        )
    )
}

# FLUID BOCK

fluid <- function(){
    box(
        collapsed = TRUE,
        width = 12,
        title = 'Propiedades de Fluido',
        shiny::numericInput(
            inputId = 'gamao',
            label = 'Gamma-o',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'gamaw',
            label = 'Gamma-w',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'gamag',
            label = 'Gamma-g',
            value = NULL
        )
    )
}

# VOLTAGE CONTROL

voltage <- function(){
    box(
        collapsed = TRUE,
        width = 12,
        title = 'Datos de Alimentacion',
        shiny::numericInput(
            inputId = 'volt',
            label = 'Voltaje',
            value = NULL
        )
    )
}

# COMPORTAMIENTO DE AFLUENCIA

fluent <- function(){
    box(
        collapsed = TRUE,
        width = 12,
        title = 'Comportamiento de Afluencia',
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'pwh',
                    label = 'Pwh',
                    value = NULL
                )
            ),
            column( 6,
                    shiny::numericInput(
                    inputId = 'Pcasting',
                    label = 'Pcasting',
                    value = NULL
                )
            )
        ),
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'q',
                    label = 'Q',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'fw',
                    label = 'Fw',
                    value = NULL
                )
            )
        ),
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'pws',
                    label = 'Pws',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'ip',
                    label = 'IP',
                    value = NULL
                )
            )
        ),
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'rga',
                    label = 'RGA',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'tsuc',
                    label = 'T_suc',
                    value = NULL
                )
            )
        ),
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'qo',
                    label = 'qo',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'fo',
                    label = 'Fo',
                    value = NULL
                )
            )
        ),
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'qw',
                    label = 'qw',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'wor',
                    label = 'WOR',
                    value = NULL
                )
            )
        ),
        column( 6,
            shiny::numericInput(
                inputId = 'bw',
                label = 'Bw',
                value = NULL
            )
        )
    )
}


# VARIABLES ESPECIALES

special <- function(){
    box(
        collapsed = TRUE,
        width = 12,
        title = 'Valores especiales',
        shiny::numericInput(
            inputId = 'g',
            label = 'G',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'nsep',
            label = 'n_sep',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'pip',
            label = 'PIP',
            value = NULL
        )
    )
}