library(shinyalert)
library(tidyverse)
library(shiny)
library(DT)

source('varStorage.R')

shinyServer(function(input, output) {
    
    but <- reactiveValues( start = FALSE, start2 = FALSE )
    
    observeEvent(input$start_but, {
        but$start <- TRUE
        
        bw <<- input$bw;       ditr <<- input$ditr;   ditp <<- input$ditp     
        fo <<- input$fo;       fw   <<- input$fw;     gamao<<- input$gamao 
        gamaw <<- input$gamaw; gamag <<- input$gamag; ip <<- input$ip
        pws <<- input$pws;     phitp <<- input$phitp; profperf <<- input$profperf 
        profbomb <<- input$profbomb; ple <<- input$ple; pwh <<- input$pwh   
        Pcasating <<- input$Pcasating; tsuc <<- input$tsuc; rga <<- input$rga
        q <<- input$q;  qo <<- input$qo; qw <<- input$qw; volt <<- input$volt     
        wor <<- input$wor; pip <<- input$pip; G <<- input$g; n_sep <<- input$nsep
    })
    
    # -----------------------------
    # Proceso y muestra de datos en
    # SECCION I
    # -----------------------------
    output$sec1 <- DT::renderDT({
        if( !but$start )
            return(NULL)
        
        in_Var <- c(pws,q,ip,fw,gamaw,fo,gamao,profperf,profbomb)
        
        if( checkIfMiss(in_Var) )
            errorAlert()
        
        pwf <<- pws - q / ip
        de <<- (fw*gamaw) + (fo*gamao) 
        grad <<- 0.433*de

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
        
        in_Var <- c(gamao,gamag,tsuc,pip,qo,qw)
        
        if( checkIfMiss(in_Var) )
            errorAlert()

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
        
        lab <- c('API','Gamma', 'Rs'  , 'Rs_libre','PpL','TpC','Ppr' , 'TPr',
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
        
        in_Var <- c(ditr,phitp,bw,bo,wor,ql,
                    gamag,bg,gamao,gamaw)
        
        if( checkIfMiss(in_Var) )
            errorAlert()
        
        A <<- 0.0055*(ditr^2 - phitp^2)
        vsl <<- 6.5*10^(-5)*ql*(bo/(1+wor) + bw*wor/(1+wor))/A
        pg <<- 0.0764*gamag/bg
        pl <<- 62.4*(gamao/(bo*(1+wor)) + gamaw*wor/(bw*(1+wor)))
        
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
        
        return( tibble( Label = lab, Value = val ) )
    })
    
    output$ldyn <- renderText(return( paste( "Ldyn = ",round((profbomb*gamao*0.433 + ple - pip)/(gamao*0.433),3), sep = " " ) ) )

    output$grph1 <- renderImage({
        filename <- normalizePath(file.path('./imgs/Graph1.png'))
        list(src = filename, height="106%", width="98%")
    }, deleteFile = FALSE)
    
    # Segunda Parte ----------------------------------------
    
    observeEvent(input$bombSpecButton,{
      but$start2 <- TRUE
      
      dhfr <<- input$dhfr 
      headstor <<- input$headstage 
      bhpstage <<- input$bhpstage
      maxhead <<- input$maxhead
      allshaftPow <<- input$allshaftPow 
      shaftDiam <<- input$shaftDiam 
      horBurPre <<- input$horBurPre 
      hpnp <<- input$hpnp
      vplaca <<- input$vplaca 
      inp <<- input$inp 
      voltsurf <<- input$voltsurf
      housing <<- input$housing
    })
    
    output$specs <- DT::renderDT({
      if(!but$start2)
        return(NULL)
      ldyn <<- round((profbomb*gamao*0.433 + ple - pip)/(gamao*0.433),3)
      totaldhfr <<- dhfr*profbomb/1000
      # PLE = whp
      # Ldyn = chp
      tdh <<- 2.31*(ple-ldyn)/de + ldyn + totaldhfr
      etapas <<- tdh / headstor
      bhpBomb <<- bhpstor*housing*de
      p_max <<- maxhead * housing * grad
      i <<- inp * bhpBomb/hpnp
      
      lab <- c('TDH','TotalDHFR','ETAPAS','BHP_Bomb','Pmax','I')
      val <- c(tdh  ,totaldhfr  ,etapas  ,bhpBomb   ,p_max,i)
      return( tibble( Label = lab, Value = val ) )
    })
    
    
})