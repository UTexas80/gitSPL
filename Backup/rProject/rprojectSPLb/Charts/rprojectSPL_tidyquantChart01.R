# Loads tidyquant, tidyverse, lubridate, xts, quantmod, TTR 
library(ggplot2) 
library(tidyquant) 

# Get SPL Stock Prices
SPL <- tq_get("SPL.AX", get = "stock.prices", from = "2010-05-19", to = "2017-10-30")

# Setup dates for zoom window
end <- ymd("2017-10-30")
start <- end - weeks(20)

# Create chart
SPL %>%
  ggplot(aes(x = date, y = close)) +
  geom_candlestick(aes(open = open, close = close, high = high, low = low)) + 
  geom_bbands(aes(high = high, low = low, close = close),
              ma_fun = SMA, n = 20, sd = 2, size = 1) + 
  labs(title = "AMZN: New Candlestick Geom + BBands!",
       subtitle = "Quickly visualize volatility",
       x = "", y = "Closing Price") +
  coord_x_date(xlim = c(start, end),
               ylim = c(0.45, 1.90))
