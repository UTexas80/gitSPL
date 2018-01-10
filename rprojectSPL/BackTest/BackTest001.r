# http://blog.fosstrading.com/2011/03/how-to-backtest-strategy-in-r.html
require(quantmod)
require(PerformanceAnalytics)

# Step 1: Get the data
getSymbols("SPL.AX")
# SPL<-SPL[complete.cases(SPL),]                                                  # Delete NA
## use underlying time scale for interpolation
na.approx(SPL.AX) 

# Step 2: Create your indicator
dvi <- DVI(Cl(na.approx(SPL.AX)))
# dfDVI <- data.frame(dvi)
# Convert indicartor to a tibble
# dvi <- as_data_frame(dvi)

# Step 3: Construct your trading rule
sig <- Lag(ifelse(dvi$dvi < 0.5, 1, -1))

# Step 4: The trading rules/equity curve
ret <- ROC(Cl(na.approx(SPL.AX)))*sig
ret <- ret['2009-06-02/2010-09-07']
eq <- exp(cumsum(ret))
plot(eq)

# Step 5: Evaluate strategy performance
table.Drawdowns(ret, top=10)
table.DownsideRisk(ret)
charts.PerformanceSummary(ret)