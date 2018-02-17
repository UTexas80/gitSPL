
l.out <- BatchGetSymbols(tickers = tickers, 
                         first.date = first.date,
                         last.date = last.date)

# Stock Download Processing -----------------------------------------------------------------------------------
# https://stackoverflow.com/questions/3507744/downloading-yahoo-stock-prices-in-r
# symbols <- c("MSFT", "C", "VIA/B", "MMM")
# symbols <- c("SPL.AX", "SPHRF", "SPHRY")

# Download data in tidy format. 
# Will remove VIA/B and warn you.

data <- tq_get(symbols)                                                         # Get Stock Prices
data %>% mutate_cond(symbol == "SPL.AX", date = date + 1)

# data <- filter(data, symbol == "SPL.AX")
# data$date <- data$date + 1                                                      # Create date variable

# data<-data[complete.cases(data),]                                               # Delete NA

# Ticker symbols as column names for closing prices
# data %>% 
#    select(.symbol, date, close) %>% 
#    spread(key = .symbol, value = close)


 # 1. retrieve data


 
 



 