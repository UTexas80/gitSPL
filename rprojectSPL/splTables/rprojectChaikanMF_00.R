library(tidyquant)                                              # Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(TTR)                                                    # Technical Trading Rules package
SPL <- tq_get("SPL.AX")                                         # Get SPL Stock Prices
SPL<-SPL[complete.cases(SPL),]                                  # Delete NA
date <- SPL$date                                                # Create date variable
#
cmf <- CMF(SPL[,c("high","low","close")],SPL[,"volume"])        # Chaikan Money Flow
cVol <- chaikinVolatility(SPL[,c("high","low")],20,maType=EMA)  # Chaikan Volatility
#
tblChaikinMF <- data.frame(date,"SPL",cmf)                      # Create Chaikan Money Flow A/D Table
tblChaikinVol <- data.frame(date,"SPL",cVol)                    # Create Chaikan Volatility Table
#
colnames(tblChaikinMF) <- c("date", "symbol", "cmf")            # Rename ChaikinMF Table Columns
colnames(tblChaikinVol) <- c("date", "symbol", "cVol")          # Rename ChaikinVol Table Columns
#
tblChaikinMF<-tblChaikinMF[complete.cases(tblChaikinMF),]       # Delete tblChaikinMF NA
tblChaikinVol<-tblChaikinVol[complete.cases(tblChaikinVol),]    # Delete tblChaikinVol NA
