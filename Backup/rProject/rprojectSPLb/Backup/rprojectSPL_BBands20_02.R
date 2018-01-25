library(tidyquant)                             # Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(TTR)                                   # Technical Trading Rules package
SPL <- tq_get("SPL.AX")                        # Get SPL Stock Prices
SPL<-SPL[complete.cases(SPL),]                 # Delete NA
bb.20 <- BBands(SPL$close,20,sd=2,maType=EMA)  # BBands - 20 Day EMA 
date <- SPL$date                               # Create date variable
tblSPL_BBands20 <- data.frame(date,bb.20)      # Create BBands Table
