testStrategy <- function(myStock, nHold=100, nHigh=200) {
  myPosition <- myStrat(myStock,nHold,nHigh)
  bmkReturns <- dailyReturn(myStock, type = "arithmetic")
  myReturns <- bmkReturns*Lag(myPosition,1)
  myReturns[1] <- 0
  names(bmkReturns) <- 'Index'
  names(myReturns) <- 'Me'
  
  charts.PerformanceSummary(cbind(bmkReturns,myReturns))
  cbind(Me=Performance(myReturns),Index=Performance(bmkReturns))
  
}

getSymbols('SPL.AX',from='1900-01-01')

## use underlying time scale for interpolation
#na.approx(SPL.AX) 

# getSymbols('DJIA', src='FRED')
# getSymbols('^N225',from='1900-01-01')

testStrategy(na.omit(Cl(SPL.AX)),100,200)

# testStrategy(na.omit(DJIA),100,200)
# round(testStrategy(Cl(N225),100,200),8)