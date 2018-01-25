require(quantmod)
require(PerformanceAnalytics)

getSymbols("^NSEI")
chartSeries(NSEI, TA=NULL)
data=NSEI[,4]

macd = MACD(data, nFast=12, nSlow=26,nSig=9,maType=SMA,percent = FALSE)
dfMACD <- data.frame(macd) 

chartSeries(data, TA="addMACD()")
signal <- Lag(ifelse(dfMACD$macd < dfMACD$signal, -1, 1))

returns <- ROC(data)*signal
returns <- returns['2008-06-02/2015-09-22']

portfolio <- exp(cumsum(returns))
plot(portfolio)

table.Drawdowns(ret, top=10)
table.DownsideRisk(ret)
charts.PerformanceSummary(ret)