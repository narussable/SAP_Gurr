library(bs4Dash)
library(shiny)
library(DT)

source('inVar.R')

# Define UI for application that draws a histogram
ui <- dashboardPage(
    skin = 'black',
    dashboardHeader(title = "Segundo programa"),
    dashboardSidebar(collapsed = TRUE),
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
                       width = 12,
                       DT::dataTableOutput('sec1')
                   ),
                   
                   box(
                       title = 'Propiedad de los Fluidos',
                       width = 12,
                       useShinyalert(),
                       DT::dataTableOutput('sec2')
                   )
               )
           )
        )
    )
)
