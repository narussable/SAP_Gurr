
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