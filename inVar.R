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
                    label = '$$D.I.T.R.:$$ ',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'ditp',
                    label = '$$D.I.T.P.:$$ ',
                    value = NULL
                )
            )
        ),
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'phitp',
                    label = '$$\\phi TP:$$',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'profperf',
                    label = '$$Prof. de Perf.:$$ ',
                    value = NULL
                )
            )
        ),
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'profbomb',
                    label = '$$Prof. de Bomba:$$ ',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'ple',
                    label = '$$Ple:$$',
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
            label = '$$\\gamma_o:$$',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'gamaw',
            label = '$$\\gamma_w:$$',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'gamag',
            label = '$$\\gamma_g:$$',
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
            label = '$$V_{disp}:$$',
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
                    label = '$$P_{wh}:$$',
                    value = NULL
                )
            ),
            column( 6,
                    shiny::numericInput(
                    inputId = 'Pcasting',
                    label = '$$P_{cast}:$$',
                    value = NULL
                )
            )
        ),
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'q',
                    label = '$$Q:$$',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'fw',
                    label = '$$F_w:$$',
                    value = NULL
                )
            )
        ),
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'pws',
                    label = '$$P_{ws}:$$',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'ip',
                    label = '$$IP:$$',
                    value = NULL
                )
            )
        ),
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'rga',
                    label = '$$RGA:$$',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'tsuc',
                    label = '$$T_{suc}:$$',
                    value = NULL
                )
            )
        ),
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'qo',
                    label = '$$q_0:$$',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'fo',
                    label = '$$F_0$$',
                    value = NULL
                )
            )
        ),
        fluidRow(
            column( 6,
                shiny::numericInput(
                    inputId = 'qw',
                    label = '$$qw:$$',
                    value = NULL
                )
            ),
            column( 6,
                shiny::numericInput(
                    inputId = 'wor',
                    label = '$$WOR:$$',
                    value = NULL
                )
            )
        ),
        column( 6,
            shiny::numericInput(
                inputId = 'bw',
                label = '$$B_w:$$',
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
            label = '$$G:$$',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'nsep',
            label = '$$n_{sep}$$',
            value = NULL
        ),
        shiny::numericInput(
            inputId = 'pip',
            label = '$$PIP:$$',
            value = NULL
        )
    )
}