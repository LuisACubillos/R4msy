#Calcula F90msy
F90msy <- optimize(findF,"Brent",lower=0,upper=FMSY)$minimum
    	val <- SPRFmort(F90msy,Amax,Tspw)
    	ypr <- val$ypr
    	spr <- val$spr
    	rec <- GetRec(spr,S0,SRModel,alpha,beta,Gamma)
    	S90msy <- spr*rec/S0*100
