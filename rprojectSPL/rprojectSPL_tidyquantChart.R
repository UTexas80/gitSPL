# Loads tidyquant, tidyverse, lubridate, xts, quantmod, TTR 
library(ggplot2) 
library(tidyquant) 
# Use FANG data set
#data("FANG") 

# Get SPL Stock Prices
SPL <- tq_get("SPL.AX", get = "stock.prices", from = "2014-01-01", to = "2017-10-30")

