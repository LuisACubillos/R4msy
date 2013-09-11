    #Calcula la produccion
    Fmort <- NULL
    yield <- NULL
    ssb <- NULL
    recs <- NULL
    Fval <- 1
    repeat
    {
        Fv =(Fval-1)*0.01
        #Calculate SPR and YPR
        Vals <- SPRFmort(Fv,Amax,Tspw)
        spr <- Vals$spr
        ypr <- Vals$ypr
        rpr <- GetRec(spr,S0,SRModel,alpha,beta,Gamma)
        Rec <- rpr/R0*100
        Yld <- ypr*rpr
        Spn <- spr*rpr/(S0*R0)*100
        #store results
        Fmort <- c(Fmort,Fv)
        recs <- c(recs,Rec)
        ssb <- c(ssb,Spn)
        yield <- c(yield,Yld)
        if(Yld < 0) break
        Fval <- Fval+1	
    }
    MaxFs <- Fval
    #Encuentra Fmsy
    BestF <- 0
    BestY <- 0
    CrashF <- 0
    for(Fval in 2:MaxFs)
    {
    	if(yield[Fval]>BestY)
    	{
    		BestY <- yield[Fval]
    		BestF <- (Fval-1)*0.01
    	}
    	if(ssb[Fval-1]>0 & ssb[Fval]<0)
    	{
    		CrashF <- (Fval-1)*0.01
    	}
    }
    minF <- BestF-0.01
    maxF <- BestF+0.01
    repeat
    {
    	FMSY <- (minF+maxF)/2
    	val <- SPRFmort(FMSY+0.001,Amax,Tspw)
    	ypr1 <- val$ypr
    	spr1 <- val$spr
    	rec1 <- GetRec(spr1,S0,SRModel,alpha,beta,Gamma)
    	val <- SPRFmort(FMSY-0.001,Amax,Tspw)
    	ypr2 <- val$ypr
    	spr2 <- val$spr
    	rec2 <- GetRec(spr2,S0,SRModel,alpha,beta,Gamma)
    	Y1 <- ypr1*rec1
    	Y2 <- ypr2*rec2
    	S1 <- spr1*rec1
    	S2 <- spr2*rec2
    	Deriv <- (Y1-Y2)/0.002
    	MSY <- (Y1+Y2)/2
    	if(Deriv>0)
    	{
    		minF = FMSY
    	}
    	else
    	{
    		maxF = FMSY
    	}
    	if(abs(Deriv)<0.0001) break
    }
    SS0 <- (S1+S2)/2
    #Find Fcrash
    minF <- CrashF-0.01
    maxF <- CrashF
    icnt <- 1
    repeat
    {
    	Fcrash <- (minF+maxF)/2
    	spr <- SPRFmort(Fcrash,Amax,Tspw)$spr
    	rec <- GetRec(spr,S0,SRModel,alpha,beta,Gamma)
    	S1 <- spr*rec
    	if(abs(S1)<0.0001) break
    	icnt <- icnt+1
    	if(icnt>100) break
    	if(S1>0)
    	   minF <- Fcrash
    	else
    	   maxF <- Fcrash
    }
