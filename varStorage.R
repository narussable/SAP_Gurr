
# GLOBAL - Input Variables
bw <- ditr <- ditp <- fo <- fw <- gamao <-NULL
gamaw <- gamag <- ip <- pws <- phitp <- NULL
profperf <- profbomb <- ple <- pwh <- qw <- NULL
Pcasating <- tsuc <- rga <- q <- qo <- NULL

G <- n_sep <- pip <- NULL

# GLOBAL - Calculated Variables
#   Seccion 1
pwf <- de <- grad <- NULL

#   Propiedad de los Fluidos
api <- y <- gamma <- rs <- rsfree <- ppc <- NULL
tpc <- tpc <- ppr <- tpr <- z <- bg <- qg <- NULL
qfree <- f <- bo <- ql <- perce <- NULL

#   Seccion 2
A <- vsl <- pg <- pl <- NULL
nn <- qing <- chi <- NULL

#   Seccion 3
qing3 <- q_fluid <- turpin <- NULL


# GLOBAL - BOMB SPECS
dhfr <- headstor <- bhpstage <- maxhead <- NULL
allshaftPow <- shaftDiam <- horBurPre <- hpnp <- NULL
vplaca <- inp <- voltsurf <- housing <- NULL

ldyn <- totaldhfr <- tdh <- etapas <- bhpBomb <- NULL
p_max <- i <- NULL

# FINAL DE LOS FINALES
l <- res <- costounit <- NULL

cali <- tibble(
            calibre = c(1,2,4,6),
            resiste = c(0.139,0.17,0.271,0.431),
            costperun = c(11.92,10.46,8.71,7.21),
            long = c(11.92,10.46,8.71,7.21)
        )

checkIfMiss <- function(vect_input){
    return( is.null(vect_input) )
}

errorAlert <- function(){
    return(
        shinyalert(
            title = 'ERROR',
            text = 'Llene todos los campos',
            size = 'm',
            type = 'error'
        )
    )
}