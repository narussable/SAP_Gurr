library(shinyalert)
library(tidyverse)
library(shiny)
library(DT)

source('checkLib.R')

checkIfMiss <- function(vect_input){
    return( is.null(vect_input) )
}

shinyServer(function(input, output) {
    
    but <- reactiveValues( start = FALSE )
    
    observeEvent(input$start_but, but$start <- TRUE)
    
    output$sec1 <- DT::renderDT({
        if( !but$start )
            return(NULL)
        
        in_Var <- c(
            input$bw, input$ditr, input$ditp,
            input$fo, input$fw, input$gamao,
            input$gamaw,input$gamag,input$ip,
            input$pws,input$phitp,
            input$profperf,input$profbomb,input$ple,
            input$pwh,input$Pcasating, input$tsuc,
            input$rga,input$Q, input$qo,
            input$volt, input$wor  
        )
        
        if( !checkIfMiss(in_Var) ){
            shinyalert(
                title = 'ERROR',
                text = 'Llene todos los campos',
                size = 'm',
                type = 'error'
            )
            return(NULL)
        }
            
        
        pwf <- input$pws - input$Q / input$ip
        de <- (input$fw*input$gamaw) - (input$fo*input$gamao) 
        grad <- 0.433*de
        pip <- pwf - ((input$profperf-input$profbomb)*grad)
        
        lab <- c('Pwf','DE','Grad','PIP')
        val <- c(pwf  ,de  ,grad  ,pip) 
            
        return(
            df <- tibble(
                Label = lab,
                Value = val
            )
        )
    })

})
