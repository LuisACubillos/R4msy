R4msy
====================

## Biological points of reference

R4msy is an application to estimate biological points of reference (BPRs) for fisheries management, in terms of the Maximum Sustainable Yield (MSY) on the basis of life history parameters such as growth, natural mortality rate, maturity, and fishing gear selectivity.

The approach is based on a combination of yield per recruit (_YPR_) and spawning stock biomass per recruit (SPR) with stock-recruitment (S-R) models. The S-R models of Beverton and Holt, as well as Ricker's model, are reparameterized in terms of a parameter called _steepness_ (_h_), which is defined as the proportion of unfished recruitment (_R_o) produced at 20% of unfished spawning stock biomass (_S_o).

The equilibrium population is modeled on a per recruit basis, i.e., _R_o=1. Therefore, the unfished spawning stock biomass is computed when the fishing mortality rate (_F_) is zero (_F_=0), and hence _S_o=_SPR_o.

R4msy compute the fishing mortality rate at MSY (_Fmsy_), the fishing mortality rat at fishery collapse (_Fcrash_), the fishing mortality rate at 90% of MSY (_F0.9msy_), and the fishing mortality rate at 75% of MSY (_F0.75msy_). In addition, the ratio between the spawning stock biomass at MSY and the unfished spawning stock biomass (_Smsy__/_S_o), as well as at 90%MSY and 75%MSY are also computed.

