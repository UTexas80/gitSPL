# Load the project
library("ProjectTemplate"); load.project()

# Clear the workspace
rm(list=ls())

#Check which packages you have installed with
row.names(installed.packages())

# List Installed Packages
ip = as.data.frame(installed.packages()[,c(1,3:4)])
ip = ip[is.na(ip$Priority),1:2,drop=FALSE]
ip


# How to install a package from GitHub

    1. First, you need to install the devtools package. You can do this from CRAN.
    2. Load the devtools package. library(devtools)
    3. In most cases, you just use install_github("author/package") .
       a. devtools::install_github("ropenscilabs/styles")
       b. devtools::install_github("fkeck/editheme")
       c. devtools::install_github("r-lib/later")

#Find installed packages
ip <- as.data.frame(installed.packages()[,c(1,3:4)])
rownames(ip) <- NULL
ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]
print(ip, row.names=FALSE)

###############################################################################
# Install Systematic Investor Toolbox (SIT) package
# github.com/systematicinvestor/SIT
###############################################################################
# 1. please first install curl
# install.packages('curl', repos = 'http://cran.r-project.org')
# 2. next first install SIT.date
# devtools::install_github('systematicinvestor/SIT.date')
# 3. finally install sit
# library(curl)
# curl_download('https://github.com/systematicinvestor/SIT/raw/master/SIT.tar.gz', 'sit',mode = 'wb',quiet=T)
# install.packages('sit', repos = NULL, type='source')
library(curl)


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

###############################################################################
# The grammer of graphics
# http://r4ds.had.co.nz
###############################################################################
# ggplot(data = <DATA>) + 
#   <GEOM_FUNCTION>(
#      mapping = aes(<MAPPINGS>),
#      stat = <STAT>, 
#      position = <POSITION>
#   ) +
#   <COORDINATE_FUNCTION> +
#   <FACET_FUNCTION>

# Stock Download Processing -----------------------------------------------------------------------------------
# https://stackoverflow.com/questions/3507744/downloading-yahoo-stock-prices-in-r

# Description: Test if the object is a tibble.

# is.tibble {tibble}	R Documentation

# Usage

# is.tibble(x)
# is_tibble(x)

All R statements where you create objects, assignment statements, have the same form:

object_name <- value

When reading that code say “object name gets value” in your head.


Pipes:  a good way to pronounce %>% when reading code is “then”
###############################################################################
# dplyr basics
# five key dplyr functions that allow you to solve the vast majority of your data manipulation challenges:

    # Pick observations by their values (filter()).
    # Reorder the rows (arrange()).
    # Pick variables by their names (select()).
    # Create new variables with functions of existing variables (mutate()).  mutate() adds new columns that are functions of existing columns.
    # Collapse many values down to a single summary (summarise()).

# These can all be used in conjunction with group_by() which changes the scope of each function from operating on the entire dataset to operating on it group-by-group. These six functions provide the verbs for a language of data manipulation.

# All verbs work similarly:

#     The first argument is a data frame.
#     The subsequent arguments describe what to do with the data frame, using the variable names (without quotes).
#     The result is a new data frame.  

###############################################################################


RStudio tip: a useful keyboard shortcut is Cmd/Ctrl + Shift + P. This resends the previously sent chunk from the editor to the console. This is very convenient when you’re (e.g.) exploring the value of n in the example above. You send the whole block once with Cmd/Ctrl + Enter, then you modify the value of n and press Cmd/Ctrl + Shift + P to resend the complete block.