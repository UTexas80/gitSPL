# Loads tidyquant, tidyverse, lubridate, xts, quantmod, TTR 
library(ggplot2) 
library(tidyquant) 

# Get SPL Stock Prices
SPL <- tq_get("SPL.AX", get = "stock.prices", from = "2010-05-19", to = "2017-10-30")

# Example 1: Return logarithmic daily returns using periodReturn()
SPL %>%
  tq_mutate(select = close, mutate_fun = periodReturn,
            period = "daily", type = "log")


SPL_macd <- SPL %>%
  tq_mutate(select     = close, 
            mutate_fun = MACD, 
            nFast      = 12, 
            nSlow      = 26, 
            nSig       = 9, 
            maType     = SMA) %>%
  mutate(diff = macd - signal) %>%
  select(-(open:volume))


library(tidyquant)

##### Basic Functionality

SPL<- tq_get("SPL.AX", get  = "stock.prices", from = "2016-01-01", to   = "2017-01-30")

# Example 1: Return logarithmic daily returns using periodReturn()
SPL %>%
  
  tq_mutate(select = close, mutate_fun = periodReturn,
            period = "daily", type = "log")





library(tidyquant)

##### Basic Functionality

SPL<- tq_get("SPL.AX", get  = "stock.prices", from = "2016-01-01", to   = "2017-01-30")

# Example 1: Return logarithmic daily returns using periodReturn()
SPL %>%
  
  tq_mutate(select     = close, 
            mutate_fun = MACD, 
            nFast      = 12, 
            nSlow      = 26, 
            nSig       = 9, 
            maType     = SMA) %>%
  mutate(diff = macd - signal) %>%
  select(-(open:volume))

SPL %>%
  filter(date >= as_date("2016-01-01")) %>%
  ggplot(aes(x = date)) + 
  geom_hline(yintercept = 0, color = palette_light()[[1]]) +
  geom_line(aes(y = macd, col = SPL)) +
  geom_line(aes(y = signal), color = "blue", linetype = 2) +
  geom_bar(aes(y = diff), stat = "identity", color = palette_light()[[1]]) +
  facet_wrap(~ symbol, ncol = 2, scale = "free_y") +
  labs(title = "FANG: Moving Average Convergence Divergence",
       y = "MACD", x = "", color = "") +
  theme_tq() +
  scale_color_tq()


library(tidyquant)

##### Basic Functionality

SPL<- tq_get("SPL.AX", get  = "stock.prices", from = "2016-01-01", to   = "2017-01-30")

SPL_daily_log_returns <- SPL %>%
#  group_by(symbol) %>%
  tq_transmute(select     = adjusted, 
               mutate_fun = periodReturn, 
               period     = "daily", 
               type       = "log",
               col_rename = "monthly.returns")

SPL_daily_log_returns %>%
  ggplot(aes(x = monthly.returns, fill = symbol)) +
  geom_density(alpha = 0.5) +
  labs(title = "FANG: Charting the Daily Log Returns",
       x = "Monthly Returns", y = "Density") +
  theme_tq() +
  scale_fill_tq()  
  facet_wrap(~ symbol, ncol = 2)