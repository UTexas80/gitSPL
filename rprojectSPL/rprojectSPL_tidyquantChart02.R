Load libraries
library(tidyquant)

SPL <- tq_get("SPL.AX")
#'
#' # SMA
SPL %>%
   ggplot(aes(x = date, y = adjusted)) +
   geom_line() +                         # Plot stock price
   geom_ma(ma_fun = SMA, n = 50) +                 # Plot 50-day SMA
   geom_ma(ma_fun = SMA, n = 200, color = "red") + # Plot 200-day SMA
   coord_x_date(xlim = c(today() - weeks(12), today()),
              ylim = c(0.1, 2.0))                     # Zoom in
#'
#' # EVWMA
SPL %>%
   ggplot(aes(x = date, y = adjusted)) +
   geom_line() +                                                   # Plot stock price
   geom_ma(aes(volume = volume), ma_fun = EVWMA, n = 50) +         # Plot 50-day EVWMA
   coord_x_date(xlim = c(today() - weeks(12), today()),
                ylim = c(0.50, 2.0))                                  # Zoom in



SPL %>%
ggplot(aes(x = date, y = adjusted)) +
  geom_line() +                         # Plot stock price
  geom_ma(ma_fun = ZLEMA, n = 10, ratio = NULL) +                 # Plot 50-day SMA
# geom_ma(ma_fun = ZLEMA, n = 200, color = "red") + # Plot 200-day SMA
  coord_x_date(xlim = c(today() - weeks(12), today()),
               ylim = c(0.3, 2.0))                     # Zoom in

FANG_macd <- FANG %>%
  group_by(symbol) %>%
  tq_mutate(select     = close, 
            mutate_fun = MACD, 
            nFast      = 12, 
            nSlow      = 26, 
            nSig       = 9, 
            maType     = SMA) %>%
  mutate(diff = macd - signal) %>%
  select(-(open:volume))
FANG_macd