#install.packages('quantmod')
# Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(tidyquant)
library(caTools)
library(ggplot2) 
library(plotly)
library(TTR)

# Setup dates for zoom window
#end <- ymd("2017-10-30")
end <-  today()
from <- today() - years(10)
start <- end - weeks(52)


# Get SPL Stock Prices
SPL <- tq_get("SPL.AX")

#Delete NA *********************************************************************************************
SPL<-SPL[complete.cases(SPL),]
SPL

bb.20 <- BBands(SPL$close,20,sd=2,maType=EMA)
t = data.frame(SPL,bb.20)
t

splClose <- SPL$close[!is.na(SPL$close)]
splHigh <- SPL$high[!is.na(SPL$high)]
splLow <- SPL$low[!is.na(SPL$low)]
bb.20 <- BBands(SPL$close,20,sd=2,maType=EMA)
ema.14 <-   EMA(SPL$close, 14)
sma.20 <-   SMA(SPL$close, 20)
rsi.14 = RSI(SPL$close,n=14,"EMA",wilder = TRUE)
macd <- SPL %>%
  tq_mutate(select     = close, 
            mutate_fun = MACD, 
            nFast      = 12, 
            nSlow      = 26, 
            nSig       = 9, 
            maType     = SMA) %>%
  mutate(diff = macd - signal) %>%
  select(-(open:volume))

rsiSPL = data.frame(SPL,rsi.14)
rsiSPL
SPL_TA = data.frame(SPL,ema.14,sma.20,bb.20,rsi.14,macd)

SPL %>%
  tq_mutate(select = close, mutate_fun = SMA, n = 15) %>%
  rename(SMA.15 = SMA) %>%
  tq_mutate(select = close, mutate_fun = SMA, n = 50) %>%
  rename(SMA.50 = SMA)