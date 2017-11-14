library(tidyquant)                                              # Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(TTR)                                                    # Technical Trading Rules package
SPL <- tq_get("SPL.AX")                                         # Get SPL Stock Prices
SPL<-SPL[complete.cases(SPL),]                                  # Delete NA
date <- SPL$date                                                # Create date variable
#                                                               
adx <- ADX(SPL[,c("high","low","close")])                       # Welles Wilder’s Directional Movement Index
# aroon <- AROON(SPL[,c("high","low")],20)                      # Aroon Indicator
atr <- ATR(SPL[,c("high","low","close")],n=14)                  # Average True Range Indicator
cci <- CCI(SPL[,c("high","low","close")])                       # Commodity Channel Index
cmo <- CMO(SPL[,c("close")])                                    # Chande Momentum Oscillator
dc <- DonchianChannel(SPL[,c("high","low")])                    # Donchian Channel
# emv <- EMV(SPL[,c("high","low")],SPL[,"volume"])              # Arms’ Ease of Movement Value
gmma <-GMMA(SPL[,c("close")])                                   # Guppy Multiple Moving Averages
macd <-MACD(SPL[,c("close")], 12, 26, 9, maType="EMA")          # Moving Average Convergence/Divergence (MACD)
mfi <- MFI(SPL[,c("high","low","close")],SPL[,"volume"])        # Money Flow Index
# mom <- Momentum(SPL[,c("close")])                             # Momentum Indicator
pbands <- PBands(SPL[,c("close")])                              # PBands
roc <- ROC(SPL[,c("close")])                                    # Rate of Change Indicator
rsi <- RSI(SPL[,c("close")], 14, maType="WMA",SPL[,"volume"])   # Relative Strength Indicator - 14 days Weighted Moving Average
# rpr <- RUNPERCENT(SPL[,c("close")], 260, FALSE, 0.5)          # Run Percent Rank
runsd <- runSD(SPL[,c("close")], 10, TRUE, FALSE)               # Running Standard Deviation
runWilderSum <- wilderSum(SPL[,c("close")], 10)                 # retuns a Welles Wilder style weighted sum over a n-period moving window
#
tblSPL_ADX <- data.frame(date,adx)                              # Create Welles Wilder's ADX Table
# tblSPL_AROON <- data.frame(date,aroon)                        # Create Aroon Indicator Table
tblSPL_ATR14 <- data.frame(date,atr)                            # Create Average True Range Indicator Table
tblSPL_CCI <- data.frame(date,cci)                              # Create Commodity Channel Index Table
tblSPL_CMO <- data.frame(date,cmo)                              # Create Chande Momentum Oscillator Table
tblSPL_DC <- data.frame(date,dc)                                # Create Donchian Channel Table
# tblSPL_EMV <- data.frame(date,emv)                            # Create Arms’ Ease of Movement Table
tblSPL_GMMA <- data.frame(date,gmma)                            # Create Guppy Multiple Moving Averages Table
tblSPL_MACD <- data.frame(date,macd)                            # Create Moving Average Convergence/Divergence (MACD) Table
tblSPL_MFI <- data.frame(date,mfi)                              # Create Money Flow Index Table
# tblSPL_MOM <- data.frame(date,mom)                            # Create Money Flow Index Table
tblSPL_PBands <- data.frame(date,pbands)                        # Create PBands Table
tblSPL_ROC <- data.frame(date,roc)                              # Create Rate of Change Table
tblSPL_RSI <- data.frame(date,rsi)                              # Create Relative Strength Indicator Table
# tblSPL_RPR <- data.frame(date,rpr)                            # Create Run Percent Rank Table
tblSPL_RunSD <- data.frame(date,SPL$Close, runsd)               # Create Running Standard Deviation Table
tblSPL_WilderSum <- data.frame(date,runWilderSum)               # Create Welles Wilder style weighted sum Table

