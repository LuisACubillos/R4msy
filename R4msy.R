#GLOBAL_SECTION
rm(list=ls())
setwd("~/myGits/R4msy")
source("~/myGits/R4msy/Funciones/findF.R")
source("~/myGits/R4msy/Funciones/findF2.R")
source("~/myGits/R4msy/Funciones/GetAlphaBeta.R")
source("~/myGits/R4msy/Funciones/GetRec.R")
#Von Bertalannfy
source("~/myGits/R4msy/funciones/vbgFUN.R")
#Maturity
source("~/myGits/R4msy/funciones/matFUN.R")
#Selectivity
source("~/myGits/R4msy/funciones/selFUN.R")
#Spawning and yield per recruit
source("~/myGits/R4msy/funciones/SPRFmort.R")
setwd("~/myGits/R4msy/Data")
#DATA_SECTION
myData <- read.csv("ParmsPecesPel.csv")
#Stock-Recruitment models
#1: Beverton and Holt, 2: Ricker; 3: Shepherd
SRModel <- 1
Gamma=0.1
#Steepness
h <- 0.9
R0 <- 1
DoPrint=1
#Species
#(1: sardina comun, 2: anchoveta; 3: sardina austral; 4: langostino colorado; 5: merluza de cola)
i=2
source("~/myGits/R4msy/funciones/selectFun.R")
source("~/myGits/R4msy/funciones/msyFun.R")
source("~/myGits/R4msy/funciones/90msyFun.R")
source("~/myGits/R4msy/funciones/75msyFun.R")
yield <- yield/max(yield)*100
   #Resultados finales
   outfile <- list()
   if(DoPrint)
   {
   	outfile$Spp <-Spp
   	outfile$Fmsy <- FMSY
   	outfile$Smsy <- SS0/S0*100
   	outfile$F90msy <- F90msy
   	outfile$S90msy <- S90msy
   	outfile$F75msy <- F75msy
   	outfile$S75msy <- S75msy
   	outfile$Fcrash <- Fcrash
   	print(outfile)
   }

par(mfrow=c(2,2))
max1 <- max(yield)
max2 <- max(ssb)
max3 <- max(recs)
max4 <- Fcrash*1.2
tit <- paste(Spp,"(h =",h,")")
plot(ssb,yield,type="l",lty=1,lwd=2,xlim=c(0,max2*1.1),ylim=c(0,max1*1.1),xlab="SSB (%)",ylab="Catch (%)")
   text(50,105,tit,side=3,outer=F,line=0.5,adj=0)
   arrows(SS0/S0*100,20,SS0/S0*100,0,lwd=2)
plot(Fmort,ssb,type="l",lty=1,lwd=2,xlim=c(0,max4),ylim=c(0,max2*1.1),xlab="Fishing mortality rate",ylab="SSB (%)")
   arrows(Fcrash,20,Fcrash,0,lwd=2)
plot(Fmort,yield,type="l",lty=1,lwd=2,xlim=c(0,max4),ylim=c(0,max1*1.1),xlab="Fishing mortality rate",ylab="Catch (%)")
   arrows(FMSY,20,FMSY,0,lwd=2)
plot(ssb,recs,type="l",lty=1,lwd=2,xlim=c(0,max2*1.1),ylim=c(0,max3*1.1),ylab="Recruitment (%)",xlab="SSB (%)")
   abline(0,1,lty=2)
   lines(c(20,20,0),c(0,h*100,h*100),lty=3,lwd=2)
   box()    
