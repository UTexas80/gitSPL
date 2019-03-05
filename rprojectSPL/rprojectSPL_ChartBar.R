library(quantmod) # from quantmod package
#getSymbols("SPHRF", src = "yahoo") # from yahoo finance
getSymbols("SPHRF", src = "google") # from google finance
#getQuote("SPL.AX", src = "yahoo")
head(SPHRF)
chartSeries(SPHRF)
barChart(SPL)
candleChart(SPL, multi.col = TRUE, theme = "white")


install.packages('quantmod')
install.packages("Quandl")
install.packages('TTR')

library(quantmod) # from quantmod package
getSymbols("SPHRF", src = "google") # from google finance
chartSeries(SPHRF, name = "Starpharma ", theme = 'black', TA = "addBBands();addVo()")
chartSeries(SPHRF,
            name = "Starpharma ",
            theme = 'black',
            subset = "2012-01::2017",
            TA = "addBBands();addVo()")
