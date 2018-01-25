#install.packages('quantmod')
# Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(tidyquant)
library(caTools)
library(ggplot2) 
library(plotly)

# Setup dates for zoom window
#end <- ymd("2017-10-30")
end <-  today()
from <- today() - years(10)
start <- end - weeks(52)

# Get SPL Stock Prices
SPL <- tq_get("SPL.AX")
#SPL <- tq_get("SPL.AX", get = "stock.prices", from = from)
#SPL <- tq_get("SPL.AX", get = "stock.prices", from = "2010-05-19", to = "2017-10-30")
days <- length(SPL$date)
#********************************************************************************************************************
# Base candlestick chart with volume panel

# Color or volume bars
barcols <- c()
for (i in 1:length(SPL$date)) {
  
  if (i == 1) {barcols[i] <- "#F95959"}
  
  if (i > 1) {
    x <- ifelse(df$Close[i] > df$Close[i - 1], "#455D7A", "#F95959")
    barcols[i] <- x
  }
}


# Moving Avg line
n=30; k=5;
x = SPL$close
MA <- runmean(x, k, alg="fast" )

# Range selector
rangeselectorlist = list(
  x = 0, y = 0.9,
  bgcolor = "#0099cc",
  font = list(color = "white"),
  
  buttons = list(
    list(count = 1, label = "reset", step = "all"),
    list(count = 1, label = "1yr", step = "year", stepmode = "backward"),
    list(count = 3, label = "3 mo", step = "month", stepmode = "backward"),
    list(count = 1, label = "1 mo", step = "month", stepmode = "backward"),
    list(step = "all")
  )
)

plot_ly(SPL, type = "candlestick",
        x = ~date,
        open = ~open, high = ~high, low = ~low, close = ~close,
        yaxis = "y",
        increasing = list(line = list(color = "#455D7A")),
        decreasing = list(line = list(color = "#F95959")),
        name = "Price",
        height = 600, width = 1024) %>%
  
  add_bars(data = SPL, x = ~date, y = ~volume,
           marker = list(color = barcols),
           yaxis = "y2", inherit = F, name = "Vol") %>%
  
  add_lines(x = SPL$date, y = MA,
            line = list(width = 3, dash = "5px", color = "#33bbff"),
            inherit = F, name = "Mov Avg") %>%
  
  layout(
    plot_bgcolor = "rgb(250,250,250)",
    xaxis = list(title = "", domain = c(0,0.95),
                 
                 rangeslider = list(visible = F),
                 
                 rangeselector = rangeselectorlist),
    yaxis = list(domain = c(0.22, 0.9)),
    yaxis2 = list(domain = c(0, 0.18), side = "right"),
    
    showlegend = F,
    
    annotations = list(
      list(x = 0, y = 1, xanchor = "left", yanchor = "top",
           xref = "paper", yref = "paper",
           text = paste0("<b>Starpharma</b>"),
           font = list(size = 30, family = "serif"),
           showarrow = FALSE),
      
      list(x = 0.8, y = 0.95, xanchor = "left", yanchor = "top",
           xref = "paper", yref = "paper",
           text = paste0("[", paste(range(df$dates),collapse = " / "), "]"),
           font = list(size = 15, family = "serif"),
           showarrow = FALSE),
      
      list(x = 0, y = 0.18, xanchor = "left", yanchor = "top",
           xref = "paper", yref = "paper",
           text = paste0("<b>Volume</b>"),
           font = list(size = 15, family = "serif"),
           showarrow = FALSE)
    )
  )