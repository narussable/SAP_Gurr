library(bs4Dash)
library(shiny)

pozo <- function(){
    box(
        title = 'Datos de Pozo',
        width = 12,
        collapsed = TRUE,
        shiny::numericInput(
            inputId = 'ditr',
            label = 'DITR: ',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'ditp',
            label = 'DITP: ',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'phitp',
            label = 'Phi_TP: ',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'profperf',
            label = 'Profundidad de Perf.: ',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'profbomb',
            label = 'Profundidad de Bomba: ',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'ple',
            label = 'Ple: ',
            value = NULL
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
        shiny::numericInput(
            inputId = 'pwh',
            label = 'Pwh',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'Pcasting',
            label = 'Pcasting',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'Q',
            label = 'Q',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'fw',
            label = 'Fw',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'pws',
            label = 'Pws',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'ip',
            label = 'IP',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'rga',
            label = 'RGA',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'tsuc',
            label = 'T-Succion',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'qo',
            label = 'qo',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'fo',
            label = 'Fo',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'wor',
            label = 'WOR',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'bw',
            label = 'Bw',
            value = NULL
        )
    )
}