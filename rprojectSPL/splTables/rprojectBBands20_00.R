library(tidyquant)                                            # Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(TTR)                                                  # Technical Trading Rules package
#
SPL <- tq_get("SPL.AX")                                       # Get SPL Stock Prices
SPL<-SPL[complete.cases(SPL),]                                # Delete NA
date <- SPL$date                                              # Create date variable
#
bb.20 <- BBands(SPL$close,20,sd=2,maType=EMA)                 # BBands - 20 Day EMA
disp <- Delt(bb.20[,"dn"],bb.20[,"up"])                       # Create Dispersion Column
dispDiff <-Delt(disp)                                         # Create Daily Dispersion Difference Pct Column
#
tblBBands20 <- data.frame(date,"SPL", bb.20, disp, dispDiff)  # Create BBands Table
tblBBands20<-tblBBands20[complete.cases(tblBBands20),]        # Delete NA
