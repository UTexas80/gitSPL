library(tidyquant)                                                              # Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(TTR)                                                                    # Technical Trading Rules package
# SPL Processing ---------------------------------------------------------------
SPL <- tq_get("SPL.AX")                                                         # Get SPL Stock Prices
SPL<-SPL[complete.cases(SPL),]                                                  # Delete NA
date <- SPL$date                                                                # Create date variable
# TTR Processing --------------------------------------------------------------- 
adx <- ADX(SPL[,c("high","low","close")])                                       # Welles Wilder’s Directional Movement Index
aroon <- aroon(SPL[,c("high","low")],n=20)                                      # Aroon Indicator
atr <- ATR(SPL[,c("high","low","close")],n=14)                                  # Average True Range Indicator
# Bollinger Bands Start
bb.20 <- BBands(SPL$close,20,sd=2,maType=EMA)                                   # BBands - 20 Day EMA
disp <- Delt(bb.20[,"dn"],bb.20[,"up"])                                         # Create Dispersion Column
dispDiff <-Delt(disp)                                                           # Create Daily Dispersion Difference Pct Column
# Bollinger Bands End
cci <- CCI(SPL[,c("high","low","close")])                                       # Commodity Channel Index
cmf <- CMF(SPL[,c("high","low","close")],SPL[,"volume"])                        # Chaikan Money Flow
cVol <- chaikinVolatility(SPL[,c("high","low")],20,maType=EMA)                  # Chaikan Volatility
cmo <- CMO(SPL[,c("close")])                                                    # Chande Momentum Oscillator
dc <- DonchianChannel(SPL[,c("high","low")])                                    # Donchian Channel
# emv <- EMV(SPL[,c("high","low")],SPL[,"volume"])                              # Arms’ Ease of Movement Value
gmma <-GMMA(SPL[,c("close")])                                                   # Guppy Multiple Moving Averages
macd <-MACD(SPL[,c("close")], 12, 26, 9, maType="EMA")                          # Moving Average Convergence/Divergence (MACD)
mfi <- MFI(SPL[,c("high","low","close")],SPL[,"volume"])                        # Money Flow Index
mom <- momentum(SPL[,c("close")])                                               # Momentum Indicator
obv <- OBV(SPL$close, SPL$volume )                                              # On Balance Volume
pbands <- PBands(SPL[,c("close")])                                              # PBands
roc <- ROC(SPL[,c("close")])                                                    # Rate of Change Indicator
rsi <- RSI(SPL[,c("close")], 14, maType="WMA",SPL[,"volume"])                   # Relative Strength Indicator - 14 days Weighted Moving Average
rpr <- runPercentRank(SPL[,c("close")], 260, FALSE, 0.5)                        # Run Percent Rank
runsd <- runSD(SPL[,c("close")], 10, TRUE, FALSE)                               # Running Standard Deviation
runWilderSum <- wilderSum(SPL[,c("close")], 10)                                 # retuns a Welles Wilder style weighted sum over a n-period moving window
zlema.20 <- ZLEMA(SPL$close, 20)                                                # ZLEMA - 20 Day
# Create Table -----------------------------------------------------------------
tblADX <- data.frame(date,"spl",adx)                                            # Create Welles Wilder's ADX Table
tblAROON <- data.frame(date,"spl",aroon)                                        # Create Aroon Indicator Table
tblATR14 <- data.frame(date,"spl",atr)                                          # Create Average True Range Indicator Table
tblBBands20 <- data.frame(date,"SPL", bb.20, disp, dispDiff)                    # Create BBands Table
tblCCI <- data.frame(date,"spl",cci)                                            # Create Commodity Channel Index Table
tblChaikinMF <- data.frame(date,"SPL",cmf)                                      # Create Chaikan Money Flow A/D Table
tblChaikinVol <- data.frame(date,"SPL",cVol)                                    # Create Chaikan Volatility Table
tblCMO <- data.frame(date,"spl",cmo)                                            # Create Chande Momentum Oscillator Table
tblDC <- data.frame(date,"spl",dc)                                              # Create Donchian Channel Table
# tblEMV <- data.frame(date,"spl",emv)                                          # Create Arms’ Ease of Movement Table
tblGMMA <- data.frame(date,"spl",gmma)                                          # Create Guppy Multiple Moving Averages Table
tblMACD <- data.frame(date,"spl",macd)                                          # Create Moving Average Convergence/Divergence (MACD) Table
tblMFI <- data.frame(date,"spl",mfi)                                            # Create Money Flow Index Table
tblMOM <- data.frame(date,"spl",mom)                                            # Create Momentum Table
tblOBV <- data.frame(date,"SPL",obv)                                            # Create OBV Table
tblPBands <- data.frame(date,"spl",pbands)                                      # Create PBands Table
tblPrice <- data.frame(SPL,"spl", date + 1)                                     # Create Stock Price Table
tblROC <- data.frame(date,"spl",roc)                                            # Create Rate of Change Table
tblRSI <- data.frame(date,"spl",rsi)                                            # Create Relative Strength Indicator Table
tblRPR <- data.frame(date,"spl",rpr)                                            # Create Run Percent Rank Table
tblRunSD <- data.frame(date,"spl",SPL$close, runsd)                             # Create Running Standard Deviation Table
tblWilderSum <- data.frame(date,"spl",runWilderSum)                             # Create Welles Wilder style weighted sum Table
tblZLEMA20 <- data.frame(date,"SPL", zlema.20)                                  # Create ZLEMA Table
# Delete Table NA --------------------------------------------------------------
tblADX<-tblADX[complete.cases(tblADX),]                                         # Delete tblADX NA
tblAROON<-tblAROON[complete.cases(tblAROON),]                                   # Delete tblAROON NA
tblATR14<-tblATR14[complete.cases(tblATR14),]                                   # Delete tblATR14 NA
tblBBands20<-tblBBands20[complete.cases(tblBBands20),]                          # Delete BBands20 NA
tblCCI<-tblCCI[complete.cases(tblCCI),]                                         # Delete tblCCI NA
tblChaikinMF<-tblChaikinMF[complete.cases(tblChaikinMF),]                       # Delete tblChaikinMF NA
tblChaikinVol<-tblChaikinVol[complete.cases(tblChaikinVol),]                    # Delete tblChaikinVol NA
tblCMO<-tblCMO[complete.cases(tblCMO),]                                         # Delete tblCMO NA
tblDC<-tblDC[complete.cases(tblDC),]                                            # Delete tblDC NA
# tblEMV<-tblEMV[complete.cases(tblEMV),]                                       # Delete tblEMV NA
tblGMMA<-tblGMMA[complete.cases(tblGMMA),]                                      # Delete tblGMMA NA
tblMACD<-tblMACD[complete.cases(tblMACD),]                                      # Delete tblMACD NA
tblMFI<-tblMFI[complete.cases(tblMFI),]                                         # Delete tblMFI NA
tblMOM<-tblMOM[complete.cases(tblMOM),]                                         # Delete tblATR14 NA
tblOBV<-tblOBV[complete.cases(tblOBV),]                                         # Delete OBV NA
tblPBands<-tblPBands[complete.cases(tblPBands),]                                # Delete tblPBands NA
tblROC<-tblROC[complete.cases(tblROC),]                                         # Delete tblROC NA
tblRSI<-tblRSI[complete.cases(tblRSI),]                                         # Delete tblRSI NA
tblRPR<-tblRPR[complete.cases(tblRPR),]                                         # Delete tblRPR NA
tblRunSD<-tblRunSD[complete.cases(tblRunSD),]                                   # Delete tblRunSD NA
tblWilderSum<-tblWilderSum[complete.cases(tblWilderSum),]                       # Delete tblWilderSum NA
tblZLEMA20<-tblZLEMA20[complete.cases(tblZLEMA20),]                             # Delete ZLEMA NA
# Rename Table columns ---------------------------------------------------------
colnames(tblADX) <- c("date", "symbol", "DIp", "DIn","DX","ADX")                # Rename tblADX Table Columns
colnames(tblAROON) <- c("date", "symbol", "aroonUp", "aroonDn", "oscillator"  ) # Rename tblAROON Table Columns
colnames(tblATR14) <- c("date", "symbol", "tr", "atr", "trueHigh", "trueLow" )  # Rename tblATR14 Table Columns
colnames(tblBBands20) <- c("date", "symbol", "dn", "mavg", "up", "pctB", 
  "bbDisp", "bbDispDiff")                                                       # Rename BBands Table Columns
colnames(tblCCI) <- c("date", "symbol", "cci" )                                 # Rename tblCCI Table Columns
colnames(tblChaikinMF) <- c("date", "symbol", "cmf")                            # Rename ChaikinMF Table Columns
colnames(tblChaikinVol) <- c("date", "symbol", "cVol")                          # Rename ChaikinVol Table Columns
colnames(tblCMO) <- c("date", "symbol", "cmo" )                                 # Rename tblCMO Table Columns
colnames(tblDC) <- c("date", "symbol", "high", "mid", "low" )                   # Rename tblDC Table Columns
# colnames(tblEMV) <- c("date", "symbol", "emv", "emvMA")                       # Rename tblEMV Table Columns
colnames(tblGMMA) <- c("date", "symbol", "short.lag.3", "short.lag.5", 
  "short.lag.8", "short.lag.10", "short.lag.12", "short.lag.15", "long.lag.30", 
  "long.lag.35", "long.lag.40", "long.lag.45", "long.lag.50", "long.lag.60"  )  # Rename tblGMMA Table Columns
colnames(tblMACD) <- c("date", "symbol","macd", "signal"  )                     # Rename tblMACD Table Columns
colnames(tblMFI) <- c("date", "symbol", "mfi" )                                 # Rename tblMFI Table Columns
colnames(tblMOM) <- c("date", "symbol", "mom")                                  # Rename tblMOM Table Columns
colnames(tblOBV) <- c("date", "symbol", "obv")                                  # Rename OBV Table Columns
colnames(tblPBands) <- c("date", "symbol", "dn", "center", "up" )               # Rename tblPBands Table Columns
colnames(tblPrice) <- c("date_1", "open", "high", "low", "close", "volume", 
  "adjusted", "symbol", "date" )                                                # Rename tblPBands Table Columns
colnames(tblROC) <- c("date", "symbol", "roc" )                                 # Rename tblROC Table Columns
colnames(tblRSI) <- c("date", "symbol", "rsi" )                                 # Rename tblRSI Table Columns
colnames(tblRPR) <- c("date", "symbol", "rpr" )                                 # Rename tblRPR Table Columns
colnames(tblRunSD) <- c("date", "symbol", "close", "runsd" )                    # Rename tblRunSD Table Columns
colnames(tblWilderSum) <- c("date", "symbol", "runWilderSum" )                  # Rename tblWilderSum Table Columns
colnames(tblZLEMA20) <- c("date", "symbol", "zlema20")                          # Rename ZLEMA Table Columns
# Indexing  --------------------------------------------------------------------
tblPrice <- tibble::rowid_to_column(tblPrice, "Index")                          # Add Index to tblPrice
# Reorder  ---------------------------------------------------------------------
tblPrice <- tblPrice[, c(1, 10, 2, 9, 8, 3, 4, 5, 6, 7)]                        # Reorder tblPrice columns

# Output -----------------------------------------------------------------------
# tblADX
# tblAROON
# tblATR14
# tblBBands20
# tblCCI
# tblChaikinMF
# tblChaikinVol
# tblCMO
# tblDC
# tblEMV
# tblGMMA
# tblMACD
# tblMFI
# tblMOM
# tblOBV
# tblPBands
# tblPrice
# tblROC
# tblRSI
# tblRPR
# tblRunSD
# tblWilderSum
# tblZLEMA20



