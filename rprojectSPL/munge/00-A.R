
l.out <- BatchGetSymbols(tickers = tickers, 
                        first.date = first.date,
                        last.date = last.date,
                        cache.folder = 'cache')

# Download data in tidy format. 
data <- tq_get(symbols)                                                         # Get Stock Prices
data %>% mutate_cond(symbol == "SPL.AX", date = date + 1)

# Ticker symbols as column names for closing prices
# data %>% 
#    select(.symbol, date, close) %>% 
#    spread(key = .symbol, value = close)


 
 



 