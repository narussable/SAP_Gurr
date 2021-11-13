library(bs4Dash)

# --------------
# Datos del pozo
# --------------
pozoBlock <- function(){
    box(
        collapsed = TRUE,
        title = 'Datos del Pozo',
        width = 12,
        numericInput(
            inputId = 'ditr',
            label = 'DITR:',
            value = NULL
        ),
        numericInput(
            inputId = 'ditp',
            label = 'DITP:',
            value = NULL
        ),
        numericInput(
            inputId = 'phitp',
            label = 'PHI-TP:',
            value = NULL
        ),
        numericInput(
            inputId = 'profperf',
            label = 'Profundidad de Perforacion:',
            value = NULL
        ),
        numericInput(
            inputId = 'profbomb',
            label = 'Profundidad de Bomba:',
            value = NULL
        ),
        numericInput(
            inputId = 'ple',
            label = 'PLE:',
            value = NULL
        )
    )
}

# ----------------------
# Propiedades de Fluidos
# ----------------------

fluidBlock <- function(){
    box(
        collapsed = TRUE,
        width = 12,
        title = 'Propiedades de Fluido',
        numericInput(
            inputId = 'gamao',
            label = 'Gamma-o',
            value = NULL
        ),
        numericInput(
            inputId = 'gamaw',
            label = 'Gamma-w',
            value = NULL
        ),
        numericInput(
            inputId = 'gamag',
            label = 'Gamma-g',
            value = NULL
        )
    )
}

# ---------------------
# Datos de Alimentacion
# ---------------------

feedBlock <- function(){
    box(
        collapsed = TRUE,
        width = 12,
        title = 'Datos de Alimentacion',
        numericInput(
            inputId = 'volt',
            label = 'Voltaje',
            value = NULL
        )
    )
}

# ---------------------------
# Comportamiento de Afluencia
# ---------------------------

fluentBlock <- function(){
    box(
        collapsed = TRUE,
        width = 12,
        title = 'Comportamiento de Afluencia',
        numericInput(
            inputId = 'pwh',
            label = 'Pwh',
            value = NULL
        ),
        numericInput(
            inputId = 'Pcasting',
            label = 'Pcasting',
            value = NULL
        ),
        numericInput(
            inputId = 'Q',
            label = 'Q',
            value = NULL
        ),
        numericInput(
            inputId = 'fw',
            label = 'Fw',
            value = NULL
        ),
        numericInput(
            inputId = 'pws',
            label = 'Pws',
            value = NULL
        ),
        numericInput(
            inputId = 'ip',
            label = 'IP',
            value = NULL
        ),
        numericInput(
            inputId = 'rga',
            label = 'RGA',
            value = NULL
        ),
        numericInput(
            inputId = 'tsuc',
            label = 'T-Succion',
            value = NULL
        ),
        numericInput(
            inputId = 'qo',
            label = 'qo',
            value = NULL
        ),
        numericInput(
            inputId = 'fo',
            label = 'Fo',
            value = NULL
        ),
        numericInput(
            inputId = 'wor',
            label = 'WOR',
            value = NULL
        ),
        numericInput(
            inputId = 'bw',
            label = 'Bw',
            value = NULL
        )
    )
}
