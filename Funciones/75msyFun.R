#Calcula F75%msy
F75msy <- optimize(findF2,"Brent",lower=0,upper=FMSY)$minimum
    	val <- SPRFmort(F75msy,Amax,Tspw)
    	ypr <- val$ypr
    	spr <- val$spr
    	rec <- GetRec(spr,S0,SRModel,alpha,beta,Gamma)
    	S75msy <- spr*rec/S0*100

