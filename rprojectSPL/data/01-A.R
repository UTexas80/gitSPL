library(tidyquant)                                                              # Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(TTR)                                                                    # Technical Trading Rules package
# SPL Processing -----------------------------------------------------------------------------------
SPL <- tq_get("SPL.AX")                                                         # Get SPL Stock Prices
SPL<-SPL[complete.cases(SPL),]                                                  # Delete NA
date <- SPL$date                                                                # Create date variable
key<-paste(as.character(format(date, "%Y")), as.character(format(date, "%m")), as.character(format(date, "%d")), "spl", sep = "")
# TTR Processing ----------------------------------------------------------------------------------- 
ad <- chaikinAD(SPL[,c("high","low","close")], SPL[,"volume"])                  # Chaikin Accumulation / Distribution Index
adx <- ADX(SPL[,c("high","low","close")])                                       # Welles Wilder’s Directional Movement Index
aroon <- aroon(SPL[,c("high","low")],n=20)                                      # Aroon Indicator
atr <- ATR(SPL[,c("high","low","close")],n=14)                                  # Average True Range Indicator
# Bollinger Bands Start
bb.20 <- BBands(SPL$close,20,sd=2,maType=EMA)                                   # BBands - 20 Day EMA
disp <- Delt(bb.20[,"dn"],bb.20[,"up"])                                         # Create Dispersion Column
dispDiff <-Delt(disp)                                                           # Create Daily Dispersion Difference Pct Column
# Bollinger Bands End
cmf <- CMF(SPL[,c("high","low","close")],SPL[,"volume"])                        # Chaikan Money Flow
cVol <- chaikinVolatility(SPL[,c("high","low")],20,maType=EMA)                  # Chaikan Volatility
clv <- CLV(SPL[,c("high","low","close")])                                       # Close Location Value
dc <- DonchianChannel(SPL[,c("high","low")])                                    # Donchian Channel
dvi <- DVI(SPL$close)                                                           # DV Intermediate Oscillator - The DV Intermediate oscillator (DVI) is a very smooth momentum oscillator that can also be used as a trend indicator.
# emv <- EMV(SPL[,c("high","low")],SPL[,"volume"])                              # Arms’ Ease of Movement Value
gmma <-GMMA(SPL[,c("close")])                                                   # Guppy Multiple Moving Averages
macd <-MACD(SPL[,c("close")], 12, 26, 9, maType="EMA")                          # Moving Average Convergence/Divergence (MACD)
mfi <- MFI(SPL[,c("high","low","close")],SPL[,"volume"])                        # Money Flow Index
# Momentum Function
cci <- CCI(SPL[,c("high","low","close")])                                       # Commodity Channel Index
cmo <- CMO(SPL[,c("close")])                                                    # Chande Momentum Oscillator
mom <- momentum(SPL[,c("close")])                                               # Momentum Indicator
momDPOprice <- DPO(SPL$close)                                                   # De-Trended Price Oscillator Momentum Indicator
momDPOvolume <- DPO(SPL$volume)                                                 # De-Trended Volume Oscillator Momentum Indicator
roc <- ROC(SPL[,c("close")])                                                    # Rate of Change Indicator
rsi <- RSI(SPL[,c("close")], 14, maType="WMA",SPL[,"volume"])                   # Relative Strength Indicator - 14 days Weighted Moving Average
stoch <- stoch(SPL[,c("high","low","close")])                                   # Stochastic Oscillator / Stochastic Momentum Index
wpr <- WPR(SPL[,c("high","low","close")], 14)                                   # William's %R Indicator
obv <- OBV(SPL$close, SPL$volume )                                              # On Balance Volume
pbands <- PBands(SPL[,c("close")])                                              # PBands
rpr <- runPercentRank(SPL[,c("close")], 260, FALSE, 0.5)                        # Run Percent Rank
runsd <- runSD(SPL[,c("close")], 10, TRUE, FALSE)                               # Running Standard Deviation
runWilderSum <- wilderSum(SPL[,c("close")], 10)                                 # retuns a Welles Wilder style weighted sum over a n-period moving window
tdi <- TDI(SPL$close, n=30)                                                     # Trend Detection Index
ult.osc <- ultimateOscillator(SPL[,c("high","low","close")])                    # Ultimate Oscillator
vhf.close <- VHF(SPL$close)                                                     # Vertical Horizontal Filter
vhf.hilow <- VHF(SPL[,c("high","low","close")])                                 # Vertical Horizontal Filter Hi / Low
# Volatility Tables
ohlc <- SPL[,c("open", "high","low","close")]                                   # Volatility OHLC parameter
tblVolatilityClose <- volatility(ohlc, calc="close")                            # Volatility
# Williams Indicators
wad <- williamsAD(SPL[,c("high","low","close")])                                # William's Williams Accumulation / Distribution 
# Moving Averages
alma.20 <- ALMA(SPL$close, 20)                                                  # Arnaud Legoux moving average - ALMA inspired by Gaussian filters. Tends to put less weight on most recent observations, reducing tendency to overshoot.
dema.20 <- DEMA(SPL$close, 20)                                                  # Double Exponential Moving Average
ema.20 <-EMA(SPL$close, 20)                                                     # Exponential Moving Average - EMA calculates an exponentially-weighted mean, giving more weight to recent observations
evwma.20 <-EVWMA(SPL$close, SPL$volume, 20)                                     # Elastic Volume-weighted Moving Average
hma.20 <- HMA(SPL$close, 20)                                                    # Hull moving average.

sma.20 <-SMA(SPL$close, 20)                                                     # Simple Moving Average - SMA calculates the arithmetic mean of the series over the past n observations.
date.20<-as.data.frame(tail(date,n=(length(sma.20))))
sma.20 <-as.data.frame(sma.20)
sma.20<-cbind(date.20,sma.20)                                                   # Simple Moving Average - adjusted for the missing first 20 days
colnames(sma.20)<-c("date", "sma")                                              #rename sma.20 column names
#vma <- VMA(SPL$close, w, ratio = 1, ...)     
trix <- TRIX(SPL$close)                                                         # Triple Smoothed Exponential Oscillator
vwas.20 <- VWAP(SPL$close, SPL$volume, 20)                                      # Volume-weighted moving average - VWAP calculate the volume-weighted moving average price.
wma.20 <- WMA(SPL$close, 20)                                                    # Weighted Moving Average - MA is similar to an EMA, but with linear weighting if the length of wts is equal to n. If the length of wts is equal to the length of x, the WMA will use the values of wts as weights.       
zz <- ZigZag( SPL[,c("high", "low")], change=20 )                               # Zig Zag higlights trends by removing price changes smaller than change and interpolating lines between the extreme points.
zlema.20 <- ZLEMA(SPL$close, 20)                                                # ZLEMA - 20 Day; ZLEMA is similar to an EMA, as it gives more weight to recent observations, but attempts to remove lag by subtracting data prior to (n-1)/2 periods (default) to minimize the cumulative effect.
# Create Table -------------------------------------------------------------------------------------
# tblEMV <- data.frame(key,date,"spl",emv)                                          # Create Arms’ Ease of Movement Table
# Momentum Tables
tblMOM <- data.frame(key,date,"spl",mom)                                            # Create Momentum Table
tblMOM_CCI <- data.frame(key,date,"spl",cci)                                        # Create Commodity Channel Index Table
tblMOM_CMO <- data.frame(key,date,"spl",cmo)                                        # Create Chande Momentum Oscillator Table
tblMOM_DPOprice <- data.frame(key,date,"spl",momDPOprice)                           # Create DeTrended Price Oscillator Table
tblMOM_DPOvolume <- data.frame(key,date,"spl",momDPOvolume)                         # Create DeTrended Volume Oscillator Table
tblMOM_ROC <- data.frame(key,date,"spl",roc)                                        # Create Rate of Change Table
tblMOM_RSI <- data.frame(key,date,"spl",rsi)                                        # Create Relative Strength Indicator Table
tblMOM_Stoch <- data.frame(key,date,"spl",stoch)                                    # Create Stochastic Oscillator / Stochastic Momentum Index Table
tblMOM_UltOsc <-data.frame(key, date,"spl",ult.osc)                                 # Create Ultimate Oscillator Table
tblMOM_WAD <- data.frame(key,date,"spl",wad)                                        # Create Williams Accumulation / Distribution Table
tblMOM_WPR <- data.frame(key,date,"spl",wpr)                                        # Create William's %R Indicator Table
# Money Tables
tblMoneyMFI <- data.frame(key,date,"spl",mfi)                                       # Create Money Flow Index Table
# Price Tables
tblPrice <- data.frame(key,SPL,"spl", date + 1)                                     # Create Stock Price Table
#Statistical Tables
tblStatRPR <- data.frame(key,date,"spl",rpr)                                        # Create Run Percent Rank Table
tblStatRunSD <- data.frame(key,date,"spl",SPL$close, runsd)                         # Create Running Standard Deviation Table
# Trend Tables
tblTrendADX <- data.frame(key,date,"spl",adx)                                       # Create Welles Wilder's ADX Table
tblTrendAROON <- data.frame(key,date,"spl",aroon)                                   # Create Aroon Indicator Table
tblTrendCLV <- data.frame(key,date,"spl",clv)                                       # Create Close Location Value Table
tblTrendDC <- data.frame(key,date,"spl",dc)                                         # Create Donchian Channel Table
tblTrendDVI <- data.frame(key,date,"spl",dvi)                                       # Create DV Intermediate oscillator (DVI Table
tblTrendGMMA <- data.frame(key,date,"spl",gmma)                                     # Create Guppy Multiple Moving Averages Table
tblTrendMACD <- data.frame(key,date,"spl",macd)                                     # Create Moving Average Convergence/Divergence (MACD) Table
tblTrendTDI <- data.frame(key,date,"spl",tdi)                                       # Create Trend Detection Index Table
tblTrendVHF <- data.frame(key,date,"spl",vhf.close)                                 # Create Vertical Horizontal Filter (Close) Table
tblTrendVHF_HiLo <- data.frame(key,date,"spl",vhf.hilow)                            # Create Vertical Horizontal Filter (High / Low) Table
tblTrendWilderSum <- data.frame(key,date,"spl",runWilderSum)                        # Create Welles Wilder style weighted sum Table
tblTrendZigZag <- data.frame(key,date,"spl",zz)                                     # Create Zig Zag Indicator Table
# Volatility Tables
tblVolatilityATR14 <- data.frame(key,date,"spl",atr)                            # Create Average True Range Indicator Table
tblVolatilityBBands20 <- data.frame(key,date,"spl", bb.20, disp, dispDiff)      # Create BBands Table
tblVolatilityChaikin <- data.frame(key,date,"spl",cVol)                         # Create Chaikan Volatility Table
tblVolatilityClose <- data.frame(key,date, "spl", tblVolatilityClose)           # Create Volatility (Close) Table
tblVolatilityPBands <- data.frame(key,date,"spl",pbands)                        # Create PBands Table
# Volume Tables
tblVolumeChaikinAD <- data.frame(key,date,"spl",ad)                             # Create # Chaikin Accumulation / Distribution Table
tblVolumeChaikinMF <- data.frame(key,date,"spl",cmf)                            # Create Chaikan Money Flow A/D Table
tblVolumeOBV <- data.frame(key,date,"spl",obv)                                  # Create OBV Table
# Moving Average Tables
tblMA_ALMA20 <- data.frame("spl", alma.20)                                      # Create Arnaud Legoux moving average table
tblMA_DEMA20 <- data.frame(key,date,"spl", dema.20)                             # Create Double Exponential Moving Average table
tblMA_EMA20 <- data.frame(key,date,"spl", ema.20)                               # Create Exponential Moving Average table
tblMA_EVWMA20 <- data.frame(key,date,"spl", evwma.20)                           # Create # Elastic Volume-weighted Moving Average table
tblMA_HMA20 <- data.frame(key,date,"spl", hma.20)                               # Create Hull moving average table
tblMA_SMA20 <- data.frame(key,date,"spl", sma.20)                               # Create Simple Moving Average table
#vma <- 
tblMA_TRIX <- data.frame(key,date,"spl",trix)                                   # Create Triple Smoothed Exponential Oscillator Moving Average Table
tblMA_VWAS20 <- data.frame(key,date,"spl", vwas.20)                             # Create Volume-weighted moving average table
tblMA_WMA20 <- data.frame(key,date,"spl", wma.20)                               # Create # Weighted Moving Average table
tblMA_ZLEMA20 <- data.frame(key,date,"spl", zlema.20)                           # Create ZLEMA Table
# Delete Table NA ----------------------------------------------------------------------------------
# tblEMV<-tblEMV[complete.cases(tblEMV),]                                       # Delete tblEMV NA
# Momentum Tables
tblMOM<-tblMOM[complete.cases(tblMOM),]                                         # Delete tblATR14 NA's
tblMOM_CCI<-tblMOM_CCI[complete.cases(tblMOM_CCI),]                             # Delete tblMOM_CCI NA's
tblMOM_CMO<-tblMOM_CMO[complete.cases(tblMOM_CMO),]                             # Delete tblMOM_CMO NA's
tblMOM_DPOprice<-tblMOM_DPOprice[complete.cases(tblMOM_DPOprice),]              # Delete tblMOM_DPOprice NA's
tblMOM_DPOvolume<-tblMOM_DPOvolume[complete.cases(tblMOM_DPOvolume),]           # Delete tblMOM_DPOprice NA's
tblMOM_ROC<-tblMOM_ROC[complete.cases(tblMOM_ROC),]                             # Delete tblMOM_ROC NA's
tblMOM_RSI<-tblMOM_RSI[complete.cases(tblMOM_RSI),]                             # Delete tblMOM_RSI NA's
tblMOM_Stoch<-tblMOM_Stoch[complete.cases(tblMOM_Stoch),]                       # Delete Stochastic Oscillator / Stochastic Momentum Index NA's
tblMOM_UltOsc<-tblMOM_UltOsc[complete.cases(tblMOM_UltOsc),]                    # Delete Ultimate Oscillator NA
tblMOM_WAD<-tblMOM_WAD[complete.cases(tblMOM_WAD),]                             # Delete William's Accumulation / Distribution NA's
tblMOM_WPR<-tblMOM_WPR[complete.cases(tblMOM_WPR),]                             # Delete William's %R Indicator NA's
# Money
tblMoneyMFI<-tblMoneyMFI[complete.cases(tblMoneyMFI),]                          # Delete tblMoneyMFI NA's
# Price
tblPrice<-tblPrice[complete.cases(tblPrice),]                                   # Delete tblPrice NA's
#Statistical Tables
tblStatRPR<-tblStatRPR[complete.cases(tblStatRPR),]                             # Delete tblStatRPR NA
tblStatRunSD<-tblStatRunSD[complete.cases(tblStatRunSD),]                       # Delete tblStatRunSD NA
# Trend Tables
tblTrendADX<-tblTrendADX[complete.cases(tblTrendADX),]                          # Delete tblTrendADX NA's
tblTrendAROON<-tblTrendAROON[complete.cases(tblTrendAROON),]                    # Delete tblTrendAROON NA's
tblTrendCLV<-tblTrendCLV[complete.cases(tblTrendCLV),]                          # Delete tblTrendCLV NA's
tblTrendDC<-tblTrendDC[complete.cases(tblTrendDC),]                             # Delete tblTrendDC NA's
tblTrendDVI<-tblTrendDVI[complete.cases(tblTrendDVI),]                          # Delete tblTrendDVI NA's
tblTrendGMMA<-tblTrendGMMA[complete.cases(tblTrendGMMA),]                       # Delete tblTrendGMMA NA
tblTrendMACD<-tblTrendMACD[complete.cases(tblTrendMACD),]                       # Delete tblTrendMACD NA's
tblTrendTDI<-tblTrendTDI[complete.cases(tblTrendTDI),]                          # Delete Trend Detection Index NA's
tblTrendVHF<-tblTrendVHF[complete.cases(tblTrendVHF),]                          # Delete Vertical Horizontal Filter (Close) NA's
tblTrendVHF_HiLo<-tblTrendVHF_HiLo[complete.cases(tblTrendVHF_HiLo),]           # Delete Vertical Horizontal Filter (High / Low) NA's
tblTrendWilderSum<-tblTrendWilderSum[complete.cases(tblTrendWilderSum),]        # Delete tblTrendWilderSum NA's
tblTrendZigZag<-tblTrendZigZag[complete.cases(tblTrendZigZag),]                 # Delete tblTrendZigZag NA's
# Volatility Tables
tblVolatilityATR14<-tblVolatilityATR14[complete.cases(tblVolatilityATR14),]     # Delete tblVolatilityATR14 NA's
tblVolatilityBBands20<-tblVolatilityBBands20[complete.cases(tblVolatilityBBands20),] # Delete tblVolatilityBBands20 NA
tblVolatilityChaikin<-tblVolatilityChaikin[complete.cases(tblVolatilityChaikin),] # Delete tblVolatilityChaikinVol NA's
tblVolatilityClose <-tblVolatilityClose[complete.cases(tblVolatilityClose),]    # Delete tblVolatilityClose NA's
tblVolatilityPBands<-tblVolatilityPBands[complete.cases(tblVolatilityPBands),]  # Delete tblVolatilityPBands NA
# Volume Tables
tblVolumeChaikinAD<-tblVolumeChaikinAD[complete.cases(tblVolumeChaikinAD),]     # Delete tblVolumeChaikinAD NA's
tblVolumeChaikinMF<-tblVolumeChaikinMF[complete.cases(tblVolumeChaikinMF),]     # Delete tblVolumeChaikinMF NA's
tblVolumeOBV<-tblVolumeOBV[complete.cases(tblVolumeOBV),]                       # Delete tblVolumeOBV NA's

# Moving Average Tables
tblMA_ALMA20 <- tblMA_ALMA20[complete.cases(tblMA_ALMA20),]                     # Delete Arnaud Legoux moving average NA
tblMA_DEMA20 <- tblMA_DEMA20[complete.cases(tblMA_DEMA20),]                     # Delete Double Exponential Moving Average NA
tblMA_EMA20 <- tblMA_EMA20[complete.cases(tblMA_EMA20),]                        # Delete Exponential Moving Average NA
tblMA_EVWMA20 <- tblMA_EVWMA20[complete.cases(tblMA_EVWMA20),]                  # Delete # Elastic Volume-weighted Moving Average NA
tblMA_HMA20 <- tblMA_HMA20[complete.cases(tblMA_HMA20),]                        # Delete Hull moving average NA
tblMA_SMA20 <- tblMA_SMA20[complete.cases(tblMA_SMA20),]                        # Delete Simple Moving Average NA
#vma <- 
tblMA_TRIX <- tblMA_TRIX[complete.cases(tblMA_TRIX),]                           # Delete Triple Smoothed Exponential Oscillator NA
tblMA_VWAS20 <- tblMA_VWAS20[complete.cases(tblMA_VWAS20),]                     # Delete Volume-weighted moving average NA
tblMA_WMA20 <- tblMA_WMA20[complete.cases(tblMA_WMA20),]                        # Delete # Weighted Moving Average NA
tblMA_ZLEMA20<-tblMA_ZLEMA20[complete.cases(tblMA_ZLEMA20),]                    # Delete ZLEMA NA
# Rename Table columns -----------------------------------------------------------------------------
# colnames(tblEMV) <- c("key","date", "symbol", "emv", "emvMA")                       # Rename tblEMV Table Columns

# Momentum Tables
colnames(tblMOM) <- c("key","date", "symbol", "mom")                                  # Rename tblMOM Table Columns
colnames(tblMOM_CCI) <- c("key","date", "symbol", "cci" )                             # Rename tblMOM_CCI Table Columns
colnames(tblMOM_CMO) <- c("key","date", "symbol", "cmo" )                             # Rename tblMOM_CMO Table Columns
colnames(tblMOM_DPOprice) <- c("key","date", "symbol", "DPOprice" )                   # Rename tblMOM_DPOprice Table Columns
colnames(tblMOM_DPOvolume) <- c("key","date", "symbol", "DPOvolume" )                 # Rename tblMOM_DPOprice Table Columns
colnames(tblMOM_ROC) <- c("key","date", "symbol", "roc" )                             # Rename tblMOM_ROC Table Columns
colnames(tblMOM_RSI) <- c("key","date", "symbol", "rsi" )                             # Rename tblMOM_RSI Table Columns
colnames(tblMOM_Stoch) <- c("key","date", "symbol", "fastK", "fastD", "slowD")        # Rename tblMOM_Stoch Table Columns
colnames(tblMOM_UltOsc) <- c("key","date", "symbol", "ultOsc")                      # Rename tblMOM_UltOsc Table Columns  
colnames(tblMOM_WAD) <- c("key","date", "symbol", "williamsAD" )                      # Rename tblWPR Table Columns
colnames(tblMOM_WPR) <- c("key","date", "symbol", "wpr" )                             # Rename tblMOM_WPR Table Columns
# Money
colnames(tblMoneyMFI) <- c("key","date", "symbol", "mfi" )                            # Rename tblMoneyMFI Table Columns
# Price
colnames(tblPrice) <- c("key","date-1", "open", "high", "low", "close", "volume", 
                        "adjusted", "symbol", "date" )                                                # Rename tblPBands Table Columns
#Statistical Tables
colnames(tblStatRPR) <- c("key","date", "symbol", "rpr" )                             # Rename tblRPR Table Columns
colnames(tblStatRunSD) <- c("key","date", "symbol", "close", "runsd" )                # Rename tblRunSD Table Columns
# Trend Tables
colnames(tblTrendADX) <- c("key","date", "symbol", "DIp", "DIn","DX","ADX")           # Rename tblTrendADX Table Columns
colnames(tblTrendAROON) <- c("key","date", "symbol", "aroonUp", "aroonDn", "oscillator"  ) # Rename tblTrendAROON Table Columns
colnames(tblTrendCLV) <- c("key","date", "symbol", "clv" )                            # Rename tblTrendCLV Table Columns
colnames(tblTrendDC) <- c("key","date", "symbol", "high", "mid", "low" )              # Rename tblTrendDC Table Columns
colnames(tblTrendDVI) <- c("key","date", "symbol", "dviMag", "dviStr", "dvi")         # Rename tblTrendDVI Table Columns
colnames(tblTrendGMMA) <- c("key","date", "symbol", "short.lag.3", "short.lag.5", 
                            "short.lag.8", "short.lag.10", "short.lag.12", "short.lag.15", "long.lag.30", 
                            "long.lag.35", "long.lag.40", "long.lag.45", "long.lag.50", "long.lag.60"  )  # Rename tblTrendGMMA Table Columns
colnames(tblTrendMACD) <- c("key","date", "symbol","macd", "signal"  )                # Rename tblTrendMACD Table Columns
colnames(tblTrendTDI) <- c("key","date", "symbol", "tdi", "di" )                      # Rename tblTrendTCI Table Columns
colnames(tblTrendVHF) <- c("key","date", "symbol", "vhfClose")                        # Rename tblTrendTCI Table Columns
colnames(tblTrendVHF_HiLo) <- c("key","date", "symbol", "vhfHiLo")                    # Rename tblTrendTCI Table Columns
colnames(tblTrendWilderSum) <- c("key","date", "symbol", "runWilderSum")              # Rename tblTrendWilderSum Table Columns
colnames(tblTrendZigZag) <- c("key","date", "symbol", "zigzag")                       # Rename tblTrendZigZag Table Columns
# Volatility Tables
colnames(tblVolatilityATR14) <- c("key","date", "symbol", "tr", "atr", "trueHigh", "trueLow" )      # Rename tblVolatilityATR14 Table Columns
colnames(tblVolatilityBBands20) <- c("key","date", "symbol", "dn", "mavg", "up", "pctB", 
                                     "bbDisp", "bbDispDiff")                                        # Rename BBands Table Columns
colnames(tblVolatilityChaikin) <- c("key","date", "symbol", "volatilityChaikin")                    # Rename ChaikinVol Table Columns
colnames(tblVolatilityClose) <- c("key","date", "symbol", "volatilityClose")                        # Rename tblVolatility_Close Table Columns
colnames(tblVolatilityPBands) <- c("key","date", "symbol", "dn", "center", "up" )                   # Rename tblVolatilityPBands Table Columns
# Volume Tables
colnames(tblVolumeChaikinAD) <- c("key","date", "symbol", "ad")                                     # Rename ChaikinAD Table Columns
colnames(tblVolumeChaikinMF) <- c("key","date", "symbol", "cmf")                                    # Rename ChaikinMF Table Columns
colnames(tblVolumeOBV) <- c("key","date", "symbol", "obv")                                          # Rename OBV Table Columns

# Moving Average Tables
colnames(tblMA_ALMA20) <- c("symbol", "alma20")                                                     # Rename Arnaud Legoux moving average columns
colnames(tblMA_DEMA20) <- c("key","date", "symbol", "dema20")                                       # Rename Double Exponential Moving Average columns
colnames(tblMA_EMA20) <- c("key","date", "symbol", "ema20")                                         # Create Exponential Moving Average table
colnames(tblMA_EVWMA20) <- c("key","date", "symbol", "evma20")                                      # Create # Elastic Volume-weighted Moving Average table
colnames(tblMA_HMA20) <- c("key","date", "symbol", "hma20")                                         # Create Hull moving average table
colnames(tblMA_SMA20) <- c("key","date", "symbol", "sma20")                                         # Create Simple Moving Average table
#vma <- 
colnames(tblMA_TRIX) <- c("key","date", "symbol", "trix", "signal")                                 # Create Triple Smoothed Exponential Oscillator table
colnames(tblMA_VWAS20) <- c("key","date", "symbol", "vwas20")                                       # Create Volume-weighted moving average table
colnames(tblMA_WMA20) <- c("key","date", "symbol", "wma20")                                         # Create # Weighted Moving Average table
colnames(tblMA_ZLEMA20) <- c("key","date", "symbol", "zlema20")                                     # Rename ZLEMA Table Columns
# Indexing  ----------------------------------------------------------------------------------------
tblPrice <- tibble::rowid_to_column(tblPrice, "Index")                                              # Add Index to tblPrice
# Reorder  -----------------------------------------------------------------------------------------
tblPrice <- tblPrice[, c(2, 1, 11, 3, 10, 4, 5, 6, 7, 9, 8)]                                        # Reorder tblPrice columns

# Output -------------------------------------------------------------------------------------------
# tblEMV
# tblMOM
# tblMOM_CCI
# tblMOM_CMO
# tblMOM_DPOprice
# tblMOM_DPOvolume
# tblMOM_ROC
# tblMOM_RSI
# tblMOM_Stoch
# tblMOM_UltOsc
# tblMOM_WAD
# tblMOM_WPR
# tblMoneyMFI
# tblPrice
# tblStatRPR
# tblStatRunSD
# tblTrendADX
# tblTrendAROON
# tblTrendCLV
# tblTrendDC
# tblTrendDVI
# tblTrendGMMA
# tblTrendMACD
# tblTrendTDI
# tblTrendVHF
# tblTrendVHF_HiLo
# tblTrendWilderSum
# tblTrendZigZag
# tblVolatilityATR14
# tblVolatilityBBands20
# tblVolatilityChaikin
# tblVolatilityClose
# tblVolatilityPBands
# tblVolumeChaikinAD
# tblVolumeChaikinMF
# tblVolumeOBV

# tblMA_ALMA20 
# tblMA_DEMA20
# tblMA_EMA20
# tblMA_EVWMA20
# tblMA_HMA20
# tblMA_SMA20
# tblMA_TRIX
# tblMA_VWAS20
# tblMA_WMA20
# tblMA_ZLEMA20


# https://stackoverflow.com/questions/18635064/error-of-ema-function-under-ttr/18635449#18635449
# The EMV function will throw this error when either:

#     the High and Low are equal for any given period, or
#     the Volume is zero for any given period.

# Correct both of those situations and the function will work.

# EBT.AX[,2] <- EBT.AX[,2]+1e-6
# EBT.AX[,5] <- EBT.AX[,5]+1e-6
# emv <- EMV(HLC(EBT.AX)[,-3], Vo(EBT.AX), n=9, maType="EMA", vol.divisor=10000)