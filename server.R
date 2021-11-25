library(shinyalert)
library(tidyverse)
library(shiny)
library(DT)

source('varStorage.R')

shinyServer(function(input, output) {
    
    but <- reactiveValues( start = FALSE, start2 = FALSE )
    
    observeEvent(input$start_but, {
        bw <<- input$bw;       ditr <<- input$ditr;   ditp <<- input$ditp     
        fo <<- input$fo;       fw   <<- input$fw;     gamao<<- input$gamao 
        gamaw <<- input$gamaw; gamag <<- input$gamag; ip <<- input$ip
        pws <<- input$pws;     phitp <<- input$phitp; profperf <<- input$profperf 
        profbomb <<- input$profbomb; ple <<- input$ple; pwh <<- input$pwh   
        Pcasating <<- input$Pcasating; tsuc <<- input$tsuc; rga <<- input$rga
        q <<- input$q;  qo <<- input$qo; qw <<- input$qw; volt <<- input$volt     
        wor <<- input$wor; pip <<- input$pip; G <<- input$g; n_sep <<- input$nsep
        
        in_Var <- c(
          bw ,ditr,ditp,fo ,fw,gamao,gamaw,gamag,ip,pws,phitp,profperf,profbomb,
          ple,pwh,Pcasating,tsuc,rga,q,qo,qw,volt,wor,pip,G,n_sep
        )
        
        if( checkIfMiss(in_Var) )
          errorAlert()
        else{
          but$start <- TRUE
          
          pwf <<- pws - q / ip
          de <<- (fw*gamaw/100) + (fo*gamao) 
          grad <<- 0.433*de
          api <<- 141.5/gamao - 131.5
          y <<- 0.00091*tsuc - 0.0125*api
          gamma <<- 0.00091*tsuc - 0.0125*api
          rs <<- gamag * (pip / (18*10^y))^1.205
          rsfree <<- rga - rs
          ppc <<- 709.6 - 58.7*gamag
          tpc <<- 170.5 + 307.3*gamag
          ppr <<- pip / ppc
          tpr <<- (tsuc+460) / tpc
          z   <<- 1 - 3.52*ppr/10^(0.9813*tpr) + 0.274*ppr^2/10^(0.8157*tpr)
          bg  <<- 0.0283*z*(tsuc+460)/pip
          qg <<- qo*(300-rs)*bg
          qfree <<- qg/5.6
          f <<- rs*(gamag/gamao)^0.5 + 1.25*tsuc
          bo <<- 0.972 + 1.47*10^(-4)*F^1.175
          ql <<- qo*bo + qw*bw
          perce <<- qfree/(ql+qfree)
          A <<- 0.0055*(ditr^2 - phitp^2)
          vsl <<- 6.5*10^(-5)*ql*(bo/(1+wor) + bw*wor/(1+wor))/A
          pg <<- 0.0764*gamag/bg
          pl <<- 62.4*(gamao/(bo*(1+wor)) + gamaw*wor/(bw*(1+wor)))
          
        }
        
    })
    
    # -----------------------------
    # Proceso y muestra de datos en
    # SECCION I
    # -----------------------------
    output$sec1 <- DT::renderDT({
        if( !but$start )
            return(NULL)
        
        lab <- c('Pwf','DE','Grad','PIP')
        val <- round(c(pwf  ,de  ,grad  ,pip),2)
            
        return( tibble( Label = lab, Value = val ) )
    })

    # -----------------------------
    # Proceso y muestra de datos en
    # PROPIEDADES DE LOS FLUIDOS
    # -----------------------------
    
    output$flu <- DT::renderDT({
        if( !but$start )
            return(NULL)
        
        lab <- c('API','Gamma', 'Rs'  , 'Rs_libre','Ppc','TpC','Ppr' , 'TPr',
                 'Z'  ,'Bg'   , 'q\'g', 'q_free'  ,'F'  ,'Bo' ,'q\'l', '%')
        val <- round(c(api  , gamma , rs    , rsfree    , ppc , tpc , ppr  , tpr,
                       z    , bg    , qg    , qfree     , f   , bo  , ql   , perce),2)
        
        return( tibble( Label = lab, Value = val ) )
    })
  
    # -----------------------------
    # Proceso y muestra de datos en
    # SECCION II
    # -----------------------------
    
    output$sec2 <- DT::renderDT({
        if( !but$start )
            return(NULL)
        
        lab <- c('A', 'Vsl', 'pg', 'pl')
        val <- c(A  , vsl  , pg  , pl  )
        # El Gg solo funciona para ciertos casos 2.
        # G = 0.04
        if( !is.null(G) ){
            vb <<- 4 * (G*32*(pl-pg)/pl^2)^0.5
            nn <<- vb/(vsl+vb)
            qing <<- qg*(1-(nn/100))/5.61
            chi <<- 2000*qing/(3*pip*ql)
            
            lab <- c(lab, 'Vb', 'nu_n', 'q_ing', 'chi')
            val <- round(c(val, vb  , nn    , qing  , chi  ),2)
        }
        
        return( tibble( Label = lab, Value = val ) )
    })
    
    # -----------------------------
    # Proceso y muestra de datos en
    # SECCION III
    # -----------------------------
    
    output$sec3 <- DT::renderDT({
        if( !but$start )
            return(NULL)
        # El G-n_sep solo funciona para ciertos casos 2.
        # n_sep = 60
        if( !is.null(G) && !is.null(n_sep) ){
            qing3 <- qg*(1-nn)*(1-n_sep/100)/5.61
            q_fluid <- ql + qing3
            turpin <- 2000*qing3/(3*pip*ql)
        }else
            return(NULL)
        lab <- c('q_ing','q_fluid','turpin')
        val <- round(c(qing3,q_fluid,turpin),2)
        
        but$start <- FALSE
        
        return( tibble( Label = lab, Value = val ) )
    })
    
    # Segunda Parte ----------------------------------------
    
    output$ldyn <- renderText(return( paste( "Ldyn = ",round((profbomb*gamao*0.433 + ple - pip)/(gamao*0.433),3), sep = " " ) ) )

    output$grph1 <- renderImage({
        filename <- normalizePath(file.path('./imgs/Graph1.png'))
        list(src = filename, height="106%", width="98%")
    }, deleteFile = FALSE)
    
    observeEvent(input$bombSpecButton,{
      but$start2 <- TRUE
      browser()
      dhfr <<- input$dhfr; headstor <<- input$headstage; bhpstage <<- input$bhpstage
      maxhead <<- input$maxhead; allshaftPow <<- input$allshaftPow; shaftDiam <<- input$shaftDiam 
      horBurPre <<- input$horBurPre; hpnp <<- input$hpnp; vplaca <<- input$vplaca 
      inp <<- input$inp; voltsurf <<- input$voltsurf; housing <<- input$housing
      
      ldyn <<- round((profbomb*gamao*0.433 + ple - pip)/(gamao*0.433),3)
      totaldhfr <<- dhfr*profbomb/1000
      #
      tdh <<- 2.31*(100-20)/de + ldyn + totaldhfr
      etapas <<- tdh / headstor
      #
      bhpBomb <<- bhpstage*housing*de
      p_max <<- maxhead * housing * grad
      i <<- inp * bhpBomb/hpnp
      
      
    })
    
    output$specs <- DT::renderDT({
      if(!but$start2)
        return(NULL)
      
      # PLE = whp
      # Ldyn = chp
      
      lab <- c('TDH','TotalDHFR','ETAPAS','BHP_Bomb','Pmax','I')
      val <- c(tdh  ,totaldhfr  ,etapas  ,bhpBomb   ,p_max,i)
      return( tibble( Label = lab, Value = val ) )
    })
    
    output$specs2 <- DT::renderDT({
      if(!but$start2)
        return(NULL)
      
      # Dato a introducir N
      #
      #cal_filt <- cali %>% filter(calibre==input$calib)
      #l <<- cal_filt %>% select(long) %>% head(1) %>% first()
      #res <<- cal_filt %>% select(resiste) %>% head(1) %>% first()
      #costounit <<- cal_filt %>% select(costperun) %>% head(1) %>% first()
      #p <- p_max/1200
      
      # cl <<- costounit*profbomb
      # --------------------------------Taza es una varibale de entrada
      # p <- taza/1200
      # pb <<- p*(cl*(1+p)^N)/((1+p)^N-1)
      # rt <<- profbomb*res*(1+0.00214*(tsuc-77))/1000
      # dpc <<- 3*i^2*rt/1000
      # cd <- 720*dpc*ce/100
      # total <<- pb + cd
      
      # Seleccion de swtichboard
      # UNP es voltaje en placa
      # vstrvnp <<- (vplaca-4*i*rt)/vplaca
      # vsurfinal <<- vplaca +  1.732*rt*i
      # psurf <- sqrt(3)*vsurfinal*i/1000
      
    })
    
    
})