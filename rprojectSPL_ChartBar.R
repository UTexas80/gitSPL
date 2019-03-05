library(quantmod)
getSymbols("SPL", src = "google") # from google finance
barChart(SPL)
candleChart(SPL, multi.col = TRUE, theme = "white")