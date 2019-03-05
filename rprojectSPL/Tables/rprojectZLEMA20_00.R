library(tidyquant)                                      # Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(TTR)                                            # Technical Trading Rules package
SPL <- tq_get("SPL.AX")                                 # Get SPL Stock Prices
SPL<-SPL[complete.cases(SPL),]                          # Delete NA
date <- SPL$date                                        # Create date variable
#
zlema.20 <- ZLEMA(SPL$close, 20)                        # ZLEMA - 20 Day
tblZLEMA20 <- data.frame(date,"SPL", zlema.20)          # Create ZLEMA Table
colnames(tblZLEMA20) <- c("date", "symbol", "zlema20")  # Rename ZLEMA Table Columns
#
tblZLEMA20<-tblZLEMA20[complete.cases(tblZLEMA20),]     # Delete ZLEMA NA
