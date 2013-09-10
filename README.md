R4msy
========================================================

## Biological points of reference

R4msy is an application to estimate biological points of reference (BPRs) for fisheries management, in terms of the Maximum Sustainable Yield (MSY) on the basis of life history parameters such as growth, natural mortality rate, maturity, and fishing gear selectivity. The approach is based on a combination between yield per recruit (YPR), spawning stock biomass per recruit (SPR), and stock-recruitment (S-R) parameters. The S-R models of Beverton and Holt, as well as Ricker's model, are reparameterized in terms of a parameter called _steepness_ (_h_), which is defined as the proportion of unfished recruitment ($R_{0}$) produced at 20% of unfished spawning stock biomass ($S_{0}$).

The equilibrium population is modeled on a per recruit basis, i.e., $R_{0}=1$. Therefore, the unfished spawning stock biomass is computed when the fishing mortality rate (_F_) is zero, i.e., $S_{0}=SPR_{F=0}$.
