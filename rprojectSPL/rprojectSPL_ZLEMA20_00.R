library(tidyquant)                             # Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(TTR)                                   # Technical Trading Rules package
SPL <- tq_get("SPL.AX")                        # Get SPL Stock Prices
SPL<-SPL[complete.cases(SPL),]                 # Delete NA
zlema.20 <- ZLEMA(SPL$close, 20)               # ZLEMA - 20 Day
tblSPL_ZLEMA20 <- data.frame(SPL,zlema.20)     # Create ZLEMA Table
