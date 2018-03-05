# Load the project
library("ProjectTemplate"); load.project()

# Clear the workspace
rm(list=ls())

# List Installed Packages
ip = as.data.frame(installed.packages()[,c(1,3:4)])
ip = ip[is.na(ip$Priority),1:2,drop=FALSE]
ip

datetemp <- sort ( unique ( unlist ( sapply (DATA, function(v) v[["Date"]]))))

# How to install a package from GitHub

    1. First, you need to install the devtools package. You can do this from CRAN.
    2. Load the devtools package. library(devtools)
    3. In most cases, you just use install_github("author/package") .
       a. devtools::install_github("ropenscilabs/styles")
       b. devtools::install_github("fkeck/editheme")
       c. devtools::install_github("r-lib/later")
       
 Theme: One Dark Raincoat bright
 

# Systematic Investor Toolbox (SIT)
#
# Systematic Investor Toolbox is a collection of tools that I use
# in my investment research. I will demonstrate and document 
# various uses of toolbox in the Systematic Investor blog at
#	www.SystematicInvestor.wordpress.com and systematicinvestor.github.io
#
#
###############################################################################
# Example Usage:
###############################################################################
#
# install.packages('curl', repos = 'http://cran.r-project.org')
# 
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

R for Data Science

# tidying and transforming are called wrangling / (i.e., munge)
Import -> Tidy -> Transform -> Visualise -> Model
All R statements where you create objects, assignment statements, have the same form:

object_name <- value

When reading that code say “object name gets value” in your head.

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
7. Exploratory Data Analysis
###############################################################################
Process:
 1. interactively ask questions, 
 2. answer them with data, and 
 3. then ask new questions.

There is no rule about which questions you should ask to guide your research. However, two types of questions will always be useful for making discoveries within your data. You can loosely word these questions as:

7.2 Questions
    1. What type of variation occurs within my variables?
    2. What type of covariation occurs between my variables?

 define some terms:

    A variable is a quantity, quality, or property that you can measure.
    A value is the state of a variable when you measure it. The value of a variable may change from measurement to measurement.
    An observation is a set of measurements made under similar conditions (you usually make all of the measurements in an observation at the same time and on the same object). An observation will contain several values, each associated with a different variable. I’ll sometimes refer to an observation as a data point.
    Tabular data is a set of values, each associated with a variable and an observation. Tabular data is tidy if each value is placed in its own “cell”, each variable in its own column, and each observation in its own row.

7.3 Variation
