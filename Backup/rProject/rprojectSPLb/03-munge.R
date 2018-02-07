# For Process 1, we want to fetch a list of desired stocks, make sure they are all in a directory, and get them
# from Yahoo! Finance if they are not present. Listing 2-3 pulls a list of S&P 500 stocks from my web site and
# converts the list to a character vector.

# Listing 2-3. List of S&P 500 Stocks

# Up-to-date at time of writing (May 2016)
url <- "http://trading.chrisconlan.com/SPstocks.csv"
S <- as.character(read.csv(url, header = FALSE)[,1])

# Changing stocks names. Because Quandl reads stocks with "_" instead of "-"
S <- gsub("-", "_", S)

# save S.R with stock list from url
# setwd(rootdir)

# We will save it in our directory so that we do not need to download it again.
dump(list = "S", "S.R")