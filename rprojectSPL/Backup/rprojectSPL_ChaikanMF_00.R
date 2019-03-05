library(tidyquant)                                            # Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(TTR)                                                  # Technical Trading Rules package
SPL <- tq_get("SPL.AX")                                       # Get SPL Stock Prices
SPL<-SPL[complete.cases(SPL),]                                # Delete NA
cmf <- CMF(SPL[,c("high","low","close")],SPL[,"volume"])      # Chaikan Money Flow
cVol <- chaikinVolatility(SPL[,c("high","low")]20,maType=EMA) # Chaikan Volatility
date <- SPL$date                                              # Create date variable
tblSPL_ChaikinMF <- data.frame(date,cmf)                      # Create Chaikan Money Flow A/D Table
tblSPL_ChaikinVol <- data.frame(date,cVol)                    # Create Chaikan Volatility Table
