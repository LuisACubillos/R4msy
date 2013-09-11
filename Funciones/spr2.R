## FUNCION PARA OPTIMZAR SOBREV JUVENILES Y SPR
spr2 <- function(PBRs){
	F66 <- PBRs[1]
	F60 <- PBRs[2]
	F50 <- PBRs[3]
	F40 <- PBRs[4]
	F35 <- PBRs[5]
	SBF0 <- 0.
	SBF66 <- 0.
	SBF60 <- 0.
	SBF50 <- 0.
	SBF40 <- 0
	SBF35 <-0.
	amax <- length(age)
	Nspr <- matrix(0,5,amax)
	for(j in 1:5){Nspr[j,1] <- 1}
	for(i in 2:amax)
	{
	 Nspr[1,i] <- Nspr[1,i-1]*exp(-M)
	 Nspr[2,i] <- Nspr[2,i-1]*exp(-(M+F66*Sel[i-1]))
	 Nspr[3,i] <- Nspr[3,i-1]*exp(-(M+F60*Sel[i-1]))
	 Nspr[4,i] <- Nspr[4,i-1]*exp(-(M+F50*Sel[i-1]))
	 Nspr[5,i] <- Nspr[5,i-1]*exp(-(M+F40*Sel[i-1]))
	 Nspr[6,i] <- Nspr[6,i-1]*exp(-(M+F35*Sel[i-1]))	 	 
	 }
	 ##solo cuando hay grupo plus
	 ##Nspr[1,Amax] <- Nspr[1,Amax-1]*exp(-M)/(1-exp(-M))
    for(i in 1:amax){
    	SBF0 <- SBF0+Nspr[1,i]*Ph[i]*W[i]*exp(-M*Tspw)
    	SBF66 <- SBF66+Nspr[2,i]*Ph[i]*W[i]*exp(-(M+F66*Sel[i])*Tspw)
    	SBF60 <- SBF60+Nspr[3,i]*Ph[i]*W[i]*exp(-(M+F60*Sel[i])*Tspw)
    	SBF50 <- SBF50+Nspr[4,i]*Ph[i]*W[i]*exp(-(M+F50*Sel[i])*Tspw)
    	SBF40 <- SBF40+Nspr[5,i]*Ph[i]*W[i]*exp(-(M+F40*Sel[i])*Tspw)
    	SBF35 <- SBF35+Nspr[6,i]*Ph[i]*W[i]*exp(-(M+F35*Sel[i])*Tspw)
    	}
    sprpen <- (SBF66/SBF0-0.66)^2
    sprpen <- sprpen+(SBF60/SBF0-0.6)^2
    sprpen <- sprpen+(SBF50/SBF0-0.5)^2
    sprpen <- sprpen+(SBF40/SBF0-0.4)^2
    sprpen <- sprpen+(SBF35/SBF0-0.35)^2
    
    #sprpen <- sprpen+(Nspr[2,7]-0.6)^2
    #    sprpen <- sprpen+(Nspr[3,7]-0.5)^2
    #    sprpen <- sprpen+(Nspr[4,7]-0.4)  	
	}
