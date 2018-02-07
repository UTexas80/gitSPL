# Data manipulations
# Highlight and run command below do load project without munging.
# This is useful when debugging data manipulation code.
# rm(list = ls()); library(ProjectTemplate); load.project(list(munging=FALSE)) 

# It is often useful to create sets of variable names
# By convention, the list that stores these variable sets is called 'v'
# v <- list()

# Checks if quantmod is installed, installs it if unavailable,
# loads it and turns off needless warning messages
if(!("quantmod" %in% as.character(installed.packages()[,1])))
  { install.packages("quantmod") } 
library(quantmod)
options("getSymbols.warning4.0"=FALSE, 
        "getSymbols.auto.assign"=FALSE)

# Loads S&P 500 ETF data, stores closing prices as a vector
SPY <- suppressWarnings(
  getSymbols(c("SPY"),from = "2012-01-01"))
SPY <- as.numeric(SPY$SPY.Close)[1:987]

# Loads SPDR S&P Biotech ETF  data, stores closing prices as a vector
XBI <- suppressWarnings(
  getSymbols(c("XBI"),from = "2012-01-01"))
XBI <- as.numeric(XBI$XBI.Close)[1:987]