require(PerformanceAnalytics)
charts.PerformanceSummary(cbind(bmkReturns,myReturns))

Performance <- function(x) {

	cumRetx = Return.cumulative(x)
	annRetx = Return.annualized(x, scale=252)
	sharpex = SharpeRatio.annualized(x, scale=252)
	winpctx = length(x[x > 0])/length(x[x != 0])
	annSDx = sd.annualized(x, scale=252)
	
	DDs <- findDrawdowns(x)
	maxDDx = min(DDs$return)
	maxLx = max(DDs$length)

	Perf = c(cumRetx, annRetx, sharpex, winpctx, annSDx, maxDDx, maxLx)
	names(Perf) = c("Cumulative Return", "Annual Return","Annualized Sharpe Ratio",
		"Win %", "Annualized Volatility", "Maximum Drawdown", "Max Length Drawdown")
	return(Perf)
}
cbind(Me=Performance(myReturns),SP500=Performance(bmkReturns))