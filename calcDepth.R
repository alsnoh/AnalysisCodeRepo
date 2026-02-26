z0 <- 5
I0 <- c(5, 5, 5, 10, 10, 10, 50, 100, 150, 250,250,250,250,250,250,250,150,100,50,10,10,10,5,5)
a_d <- 0.1
a <- 10 
b <- 100
v <- 1.5
LENGTH <- 6
dec_dist_scale <- 0.5
C <- 0.23
kR <- 3.5
E <- (   ( (LENGTH / 100 )*dec_dist_scale)^2 )/(  C *  (  (  10^(2.62 *log10( 7 ) -2.01)   )/1000000   )   )

deriv <- function(preyIA, 
                E, 
                Eb, 
                Ke,
                beam_attenuation,
                r) {
  
    #log both sides, rearrange and differentiate with respect to r
    logRHS <- log(0.23* preyIA*E ) 
    logLHS <- log( ((Ke+Eb)/Eb) * r * r * exp(beam_attenuation * r)  ) 
    equation <- logLHS-logRHS
    derivative <- beam_attenuation + 2/r 
  
    
    return (c(equation,derivative))#equation
    #derivative
  
}



getr <- function(beam_attenuation, 
                preyIA, 
                E, 
                Eb, 
                Ke, 
                tol) {

    r <- sqrt(preyIA * E * (Eb/(Ke+Eb)) * 0.23)  #first guess for r
    
    vec <- deriv(preyIA, E, Eb, Ke, beam_attenuation, r)
    eq <- vec[1]
    der <- vec[2]

    while(abs(eq) > tol) {
        # Newtons method
        r <- r - eq/der

        vec <- deriv(preyIA, E, Eb, Ke, beam_attenuation, r)
        eq <- vec[1]
        der <- vec[2]
    }

    return (r)

}
z <- z0
days <- 3
zs <- numeric(length(I0*days))

for(iday in 1:days) {
    for(ihour in 1:24) {
        
        D <- getr(a_d, 1/1000000, E, I0[ihour], kR, 0.001)
        z <- a*I0[ihour]*exp(-a_d*z) / (v * LENGTH^2) - b*D^2*pi*v*LENGTH + z
        if (z < 0) {
            z <- 0
        }
        zs[(iday-1)*24 + ihour] <- z
    }
}

plot(1:(24*days), -zs, type='b', xlab='Hour', ylab='Depth (m)', main='Depth vs Hour')

