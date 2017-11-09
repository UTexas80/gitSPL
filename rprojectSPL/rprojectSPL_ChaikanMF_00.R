library(tidyquant)                                        # Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(TTR)                                              # Technical Trading Rules package
SPL <- tq_get("SPL.AX")                                   # Get SPL Stock Prices
SPL<-SPL[complete.cases(SPL),]                            # Delete NA
cmf <- CMF(SPL[,c("high","low","close")],SPL[,"volume"])  # Chaikan Money Flow
tblSPL_ChaikinMF <- data.frame(SPL,cmf)                   # Create Chaikan Money Flow Table
