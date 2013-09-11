GetRec <- function(SPR,S0,SRModel,Alpha,Beta,Gamma=1)
{
 
# Beverton-Holt stock-recruitment relationship
if (SRModel == 1)
  RecOut <- (SPR-Alpha)/(Beta*SPR)

# Ricker
if (SRModel == 2)
  RecOut <- log(Alpha*SPR)/(Beta*SPR)

# Pella-Tomlinson
if (SRModel == 3)
  {
   term <- (1-(1.0-Alpha*SPR)/(Beta*Alpha*SPR))
	if (term <= 0)
	 RecOut <- -1
	else	 
     RecOut <- S0/SPR*term^(1.0/Gamma)	  
   }

return(RecOut)
	
}
