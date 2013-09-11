GetAlphaBeta <- function(SPR0,SRModel,Steep,R0,Gamma)
{
 	
 # Beverton-Holt
 if (SRModel == 1)
  {
	Alpha <- (1-Steep)/(4*Steep)*SPR0
	Beta <- (5*Steep-1)/(4*Steep*R0)
	SR <- "Beverton-Holt"
  }

 # Ricker
 if (SRModel == 2)
 {
   Beta = log(5.0*Steep)/(0.8*SPR0*R0)
   Alpha = exp( log(5*Steep)/0.8 )/SPR0
   SR <- "Ricker"	
 }

 # Pella-Tomlinson
 if (SRModel == 3)
  {
	Alpha <- 1.0/SPR0
	Beta <- (5*Steep-1)/(1.0-0.2^Gamma)
  }

 RetVals <- NULL	
 RetVals$Alpha <- Alpha
 RetVals$Beta <- Beta
 return(RetVals)
}
