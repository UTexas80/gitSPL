library(tidyquant)                                              # Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(TTR)                                                    # Technical Trading Rules package
SPL <- tq_get("SPL.AX")                                         # Get SPL Stock Prices
SPL<-SPL[complete.cases(SPL),]                                  # Delete NA
date <- SPL$date                                                # Create date variable
#                                                               
adx <- ADX(SPL[,c("high","low","close")])                       # Welles Wilder’s Directional Movement Index
aroon <- aroon(SPL[,c("high","low")],n=20)                      # Aroon Indicator
atr <- ATR(SPL[,c("high","low","close")],n=14)                  # Average True Range Indicator
cci <- CCI(SPL[,c("high","low","close")])                       # Commodity Channel Index
cmo <- CMO(SPL[,c("close")])                                    # Chande Momentum Oscillator
dc <- DonchianChannel(SPL[,c("high","low")])                    # Donchian Channel
emv <- EMV(SPL[,c("high","low")],SPL[,"volume"])                # Arms’ Ease of Movement Value
gmma <-GMMA(SPL[,c("close")])                                   # Guppy Multiple Moving Averages
macd <-MACD(SPL[,c("close")], 12, 26, 9, maType="EMA")          # Moving Average Convergence/Divergence (MACD)
mfi <- MFI(SPL[,c("high","low","close")],SPL[,"volume"])        # Money Flow Index
mom <- momentum(SPL[,c("close")])                               # Momentum Indicator
pbands <- PBands(SPL[,c("close")])                              # PBands
roc <- ROC(SPL[,c("close")])                                    # Rate of Change Indicator
rsi <- RSI(SPL[,c("close")], 14, maType="WMA",SPL[,"volume"])   # Relative Strength Indicator - 14 days Weighted Moving Average
rpr <- runPercentRank(SPL[,c("close")], 260, FALSE, 0.5)        # Run Percent Rank
runsd <- runSD(SPL[,c("close")], 10, TRUE, FALSE)               # Running Standard Deviation
runWilderSum <- wilderSum(SPL[,c("close")], 10)                 # retuns a Welles Wilder style weighted sum over a n-period moving window
# Create Table
tblADX <- data.frame(date,"spl",adx)                            # Create Welles Wilder's ADX Table
tblAROON <- data.frame(date,"spl",aroon)                        # Create Aroon Indicator Table
tblATR14 <- data.frame(date,"spl",atr)                          # Create Average True Range Indicator Table
tblCCI <- data.frame(date,"spl",cci)                            # Create Commodity Channel Index Table
tblCMO <- data.frame(date,"spl",cmo)                            # Create Chande Momentum Oscillator Table
tblDC <- data.frame(date,"spl",dc)                              # Create Donchian Channel Table
tblEMV <- data.frame(date,"spl",emv)                            # Create Arms’ Ease of Movement Table
tblGMMA <- data.frame(date,"spl",gmma)                          # Create Guppy Multiple Moving Averages Table
tblMACD <- data.frame(date,"spl",macd)                          # Create Moving Average Convergence/Divergence (MACD) Table
tblMFI <- data.frame(date,"spl",mfi)                            # Create Money Flow Index Table
tblMOM <- data.frame(date,"spl",mom)                            # Create Money Flow Index Table
tblPBands <- data.frame(date,"spl",pbands)                      # Create PBands Table
tblROC <- data.frame(date,"spl",roc)                            # Create Rate of Change Table
tblRSI <- data.frame(date,"spl",rsi)                            # Create Relative Strength Indicator Table
tblRPR <- data.frame(date,"spl",rpr)                            # Create Run Percent Rank Table
tblRunSD <- data.frame(date,"spl",SPL$Close, runsd)             # Create Running Standard Deviation Table
tblWilderSum <- data.frame(date,"spl",runWilderSum)             # Create Welles Wilder style weighted sum Table
# Delete  NA
tblADX<-tblADX[complete.cases(tblADX),]                         # Delete tblADX NA
tblAROON<-tblAROON[complete.cases(tblAROON),]                   # Delete tblAROON NA
tblATR14<-tblATR14[complete.cases(tblATR14),]                   # Delete tblATR14 NA
tblCCI<-tblCCI[complete.cases(tblCCI),]                         # Delete tblCCI NA
tblCMO<-tblCMO[complete.cases(tblCMO),]                         # Delete tblCMO NA
tblDC<-tblDC[complete.cases(tblDC),]                            # Delete tblDC NA
tblEMV<-tblEMV[complete.cases(tblEMV),]                         # Delete tblEMV NA
tblGMMA<-tblGMMA[complete.cases(tblGMMA),]                      # Delete tblGMMA NA
tblMACD<-tblMACD[complete.cases(tblMACD),]                      # Delete tblMACD NA
tblMFI<-tblMFI[complete.cases(tblMFI),]                         # Delete tblMFI NA
tblMOM<-tblMOM[complete.cases(tblMOM),]                         # Delete tblATR14 NA
tblPBands<-tblPBands[complete.cases(tblPBands),]                # Delete tblPBands NA
tblROC<-tblROC[complete.cases(tblROC),]                         # Delete tblROC NA
tblRSI<-tblRSI[complete.cases(tblRSI),]                         # Delete tblRSI NA
tblRPR<-tblRPR[complete.cases(tblRPR),]                         # Delete tblRPR NA
tblRunSD<-tblRunSD[complete.cases(tblRunSD),]                   # Delete tblRunSD NA
tblWilderSum<-tblWilderSum[complete.cases(tblWilderSum),]       # Delete tblWilderSum NA
# Output
tblADX
tblAROON
tblGMMA
tblMACD
tblMFI
tblMOM
tblATR14
tblCCI
tblCMO
tblDC
tblEMV
tblPBands
tblROC
tblRSI
tblRPR
tblRunSD
tblWilderSum