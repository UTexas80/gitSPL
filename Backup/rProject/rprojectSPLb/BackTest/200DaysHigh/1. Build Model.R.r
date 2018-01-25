rm(list = ls(all = TRUE))
#http://etfprophet.com/days-since-200-day-highs/

require(quantmod)
getSymbols('^GSPC',from='1900-01-01')

daysSinceHigh <- function(x, n){
   apply(embed(x, n), 1, which.max)-1
}

myStrat <- function(x, nHold=100, nHigh=200) {
	position <- ifelse(daysSinceHigh(x, nHigh)<=nHold,1,0)
	c(rep(0,nHigh-1),position)
}

myStock <- Cl(GSPC)
myPosition <- myStrat(myStock,100,200)
bmkReturns <- dailyReturn(myStock, type = "arithmetic")
myReturns <- bmkReturns*Lag(myPosition,1)
myReturns[1] <- 0

names(bmkReturns) <- 'SP500'
names(myReturns) <- 'Me'