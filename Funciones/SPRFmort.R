SPRFmort <- function(Fmort,amax,Tspw){
	     n <- length(Fmort)
	     amax <- length(age)
	     spr <- rep(0,n)
	     jpr <- rep(0,n)
	     npr <- rep(0,amax)
	     ypr <- rep(0,n)
	     npr[1] <- 1
	     for(j in 1:n){
          for(i in 2:amax)
	        {
	         npr[i] <- npr[i-1]*exp(-(M+Fmort[j]*Sel[i-1]))
   	        }
   	       for(i in 1:amax)
   	        {
   	        spr[j] <- spr[j]+npr[i]*Ph[i]*W[i]*exp(-(M+Fmort[j]*Sel[i])*Tspw)
   	        jpr[j] <- jpr[j]+npr[i]*(1-Ph[i])
   	        ypr[j] <- ypr[j]+Fmort[j]*Sel[i]*npr[i]*W[i]*(1-exp(-(M+Fmort[j]*Sel[i])))/(M+Fmort[j]*Sel[i]) 
   	         }
          }
         Pspr <- spr/spr[1]*100
         Pjpr <- jpr/jpr[1]*100         
         out <- NULL
         out$SPRo <- spr[1]
         out$spr <- spr
         out$jpr <- jpr
         out$Pspr <- Pspr
         out$Pjpr <- Pjpr
         out$ypr  <- ypr
         assign("out",out,pos=1)
	     }
