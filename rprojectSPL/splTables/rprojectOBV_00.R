library(tidyquant)                                            # Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(TTR)                                                  # Technical Trading Rules package
SPL <- tq_get("SPL.AX")                                       # Get SPL Stock Prices
SPL<-SPL[complete.cases(SPL),]                                # Delete NA
date <- SPL$date                                              # Create date variable
#
obv <- OBV(SPL$close, SPL$volume )                            # On Balance Volume
tblOBV <- data.frame(date,"SPL",obv)                          # Create OBV Table
#
tblOBV<-tblOBV[complete.cases(tblOBV),]                       # Delete OVB NA
