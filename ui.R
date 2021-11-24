library(shinyalert)
library(bs4Dash)
library(shiny)
library(DT)

source('calc_ui.R')
source('inVar.R')

# Define UI for application that draws a histogram
ui <- dashboardPage(
    skin = 'black',
    dashboardHeader(
        title = dashboardBrand(
            title = "Seleccion Bomba",
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
        tabItem(
            tabName = 'calc',
            shivers(),
            shivers2()
        ),
        tabItem(
            tabName = 'ref'
        )
    )
)
