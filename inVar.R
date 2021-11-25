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

# SPECS INPUTS

specs <- function(){
    box(
        title = 'Especificaciones de Bomba',
        width = 12,
        fluidRow(
            column( 4,
                    shiny::numericInput(
                        inputId = 'dhfr',
                        label = '$$DHFR:$$',
                        value = NULL
                    )
            ),
            column( 4,
                    shiny::numericInput(
                        inputId = 'headstage',
                        label = '$$Head/Stage:$$',
                        value = NULL
                    )
            ),
            column( 4,
                    shiny::numericInput(
                        inputId = 'bhpstage',
                        label = '$$BHP/Stage:$$',
                        value = NULL
                    )
            )
        ),
        fluidRow(
            column( 4,
                    shiny::numericInput(
                        inputId = 'maxhead',
                        label = '$$Max_{Head}:$$',
                        value = NULL
                    )
            ),
            column( 4,
                    shiny::numericInput(
                        inputId = 'allshaftPow',
                        label = '$$Allow. Shaft Pow:$$',
                        value = NULL
                    )
            ),
            column( 4,
                    shiny::numericInput(
                        inputId = 'shaftDiam',
                        label = '$$Shaft Diameter:$$',
                        value = NULL
                    )
            )
        ),
        fluidRow(
            column( 4,
                    shiny::numericInput(
                        inputId = 'horBurPre',
                        label = '$$Housing B. Pressure:$$',
                        value = NULL
                    )
            ),
            column( 4,
                    shiny::numericInput(
                        inputId = 'hpnp',
                        label = '$$H_{pnp}:$$',
                        value = NULL
                    )
            ),
            column( 4,
                    shiny::numericInput(
                        inputId = 'vplaca',
                        label = '$$V_{placa}:$$',
                        value = NULL
                    )
            )
        ),
        fluidRow(
            column( 4,
                    shiny::numericInput(
                        inputId = 'inp',
                        label = '$$I_{np}:$$',
                        value = NULL
                    )
            ),
            column( 4,
                    shiny::numericInput(
                        inputId = 'voltsurf',
                        label = '$$V_{surf}:$$',
                        value = NULL
                    )
            ),
            column( 4,
                    shiny::numericInput(
                        inputId = 'housing',
                        label = '$$Housing:$$',
                        value = NULL
                    )
            )
        ),
        shiny::actionButton(
            inputId = 'bombSpecButton',
            label = 'Calcular',
            icon = shiny::icon('calculator')
        ),
        shiny::hr(),
        shiny::hr(),
        DT::dataTableOutput('specs')
    )
}

cable <- function(){
    box(
        title = 'Seleccion de Cable',
        width = 12,
        box(
            title = 'Input Variables',
            width = 12,
            shiny::selectizeInput(
                inputId = 'calib',
                label = 'Calibre de cable:',
                choices = c(1,2,4,6)
            ),
            shiny::numericInput(
                inputId = 'lc',
                label = '$$Lc:$$',
                value = NULL
            ),
            shiny::numericInput(
                inputId = 'taza',
                label = '$$p:$$',
                value = NULL
            ),
            shiny::numericInput(
                inputId = 'N',
                label = '$$Exp. Vida:$$',
                value = NULL
            ),
            shiny::numericInput(
                inputId = 'ce',
                label = '$$Costo Electricidad:$$',
                value = NULL
            ),
            shiny::actionButton(
                inputId = 'cableCalc',
                label = 'Calcular',
                icon = shiny::icon('calculator')
            )
        ),
        
        shiny::hr(),
        shiny::hr(),
        DT::dataTableOutput('nocable')
    )
}