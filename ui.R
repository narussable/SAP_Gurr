library(shinyalert)
library(bs4Dash)
library(shiny)
library(DT)

source('inVar.R')

# Define UI for application that draws a histogram
ui <- dashboardPage(
    skin = 'black',
    dashboardHeader(
        title = dashboardBrand(
            title = "Seleccion\nhttps://www.esiatec.ipn.mx/assets/files/esiatec/img/conocenos/mision-vision/banderin-esia.png Bomba",
            color = "primary",
            image = "https://www.esiatec.ipn.mx/assets/files/esiatec/img/conocenos/mision-vision/banderin-esia.png"
        )
    ),
    dashboardSidebar(
        collapsed = TRUE,
        sidebarMenu(
            id = 'sidebarMenu',
            menuItem(
                text = 'Calculos',
                tabName = 'calc',
                icon = shiny::icon('calculator')
            ),
            menuItem(
                text = 'Referencias',
                tabName = 'ref',
                icon = shiny::icon('atlas')
            )
        )
        
    ),
    dashboardBody(
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
)
