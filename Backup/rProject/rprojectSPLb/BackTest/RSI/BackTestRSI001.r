# https://www.r-bloggers.com/testing-rsi2-with-r-first-steps/
# We will need the quantmod package for charting and pulling
# data and the TTR package to calculate RSI(2).

library(quantmod)
library(TTR)

# Pull SPL data from Yahoo! Finance
getSymbols("SPL.AX", from="2007-01-01", to="2018-01-09")
SPL<-SPL[complete.cases(SPL),]                                                  # Delete NA

# Calculate the RSI indicator
rsi <- RSI(Cl(SPL),2) # Create the long (up) and short (dn) signals
sigup <- ifelse(rsi < 10, 1, 0)
sigdn <- ifelse(rsi > 90, -1, 0)

# Lag signals to align with days in market,
# not days signals were generated
#sigup <- Lag(sigup,1) # Use lag() to avoid Toby's error
#sigdn <- Lag(sigdn,1) # Use lag() to avoid Toby's error
sigup <- lag(sigup,1) # Note k=1 implies a move *forward*
sigdn <- lag(sigdn,1) # Note k=1 implies a move *forward* # Replace missing signals with no position
# (generally just at beginning of series)
sigup[is.na(sigup)] <- 0
sigdn[is.na(sigdn)] <- 0 # Combine both signals into one vector
sig <- sigup + sigdn # Calculate Close-to-Close returns
ret <- ROC(Cl(SPL))
ret[1] <- 0 # Calculate equity curves
eq_up <- cumprod(1+ret*sigup)
eq_dn <- cumprod(1+ret*sigdn*-1)
eq_all <- cumprod(1+ret*sig) # Replicate Michael’s nice chart
plot.zoo(cbind(eq_up, eq_dn),
ylab = c("Long", "Short"), col=c("green","red"),
main="Simple RSI(2) Strategy: 2007-01-02 through 2018-010-09")

# Wait a few seconds before making next chart…
#Sys.sleep(5)

# Create a chart showing the S&P500
#chartSeries(SPL, type="line")

# Add the total equity line
#addTA(eq_all)