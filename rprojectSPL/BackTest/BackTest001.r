require(quantmod)
require(PerformanceAnalytics)

# Step 1: Get the data
getSymbols("SPL.AX")
SPL<-SPL[complete.cases(SPL),]                                                  # Delete NA

# Step 2: Create your indicator
dvi <- DVI(Cl(SPL))
dfDVI <- data.frame(dvi) 

# Step 3: Construct your trading rule
sig <- Lag(ifelse(dfDVI$dvi < 0.5, 1, -1))

# Step 4: The trading rules/equity curve
ret <- ROC(Cl(SPL))*sig
ret <- ret[2009-06-02/2010-09-07]
eq <- exp(cumsum(ret))
plot(eq)

# Step 5: Evaluate strategy performance
table.Drawdowns(ret, top=10)
table.DownsideRisk(ret)
charts.PerformanceSummary(ret)