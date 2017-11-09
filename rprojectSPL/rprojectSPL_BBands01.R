library(tidyquant)                             # Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(TTR)                                   # Technical Trading Rules package
SPL <- tq_get("SPL.AX")                        # Get SPL Stock Prices
SPL<-SPL[complete.cases(SPL),]                 # Delete NA
bb.20 <- BBands(SPL$close,20,sd=2,maType=EMA)  # BBands - 20 Day EMA 
tblSPL_BBands20 <- data.frame(SPL,bb.20)       # Create BBands Table

