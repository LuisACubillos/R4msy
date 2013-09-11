findF <- function(Fval)
    {
        Fbest <-Fval
    	val <- SPRFmort(Fbest,Amax,Tspw)
    	ypr <- val$ypr
    	spr <- val$spr
    	rec <- GetRec(spr,S0,SRModel,alpha,beta,Gamma)
    	Y1 <- ypr*rec
    	SS = (Y1-0.9*MSY)^2
    	return(SS)    	
    }
