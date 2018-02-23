# Load the project
library("ProjectTemplate"); load.project()

# Clear the workspace
rm(list=ls())

# List Installed Packages
ip = as.data.frame(installed.packages()[,c(1,3:4)])
ip = ip[is.na(ip$Priority),1:2,drop=FALSE]
ip

# How to accerss getbatchsymbols data

# l.out[["df.tickers"]]

# l.out[["df.tickers"]][["price.open"]]
# l.out[["df.tickers"]][["price.high"]]
# l.out[["df.tickers"]][["price.low"]]
# l.out[["df.tickers"]][["price.close"]]
# l.out[["df.tickers"]][["volume"]]
# l.out[["df.tickers"]][["price.adjusted"]]
# l.out[["df.tickers"]][["ret.date"]]
# l.out[["df.tickers"]][["ticker"]]
# l.out[["df.tickers"]][["ret.adjusted.prices"]]
# l.out[["df.tickers"]][["ret.closing.prices"]]

# Stock Download Processing -----------------------------------------------------------------------------------
# https://stackoverflow.com/questions/3507744/downloading-yahoo-stock-prices-in-r

# Description: Test if the object is a tibble.

# is.tibble {tibble}	R Documentation

# Usage

# is.tibble(x)
# is_tibble(x)