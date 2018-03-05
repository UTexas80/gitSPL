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

The key to asking quality questions is to generate a large quantity of questions. 
    The key to asking good follow-up questions will be to 
            rely on your curiosity (What do you want to learn more about?) as well as your skepticism (How could this be misleading?).
You can quickly drill down into the most interesting parts of your data—and develop a set of thought-provoking questions—if you follow up each question with a new question based on what you find.

Two types of questions will always be useful for making discoveries within your data.
    1. What type of variation occurs within my variables?
    2. What type of covariation occurs between my variables?

 define some terms:

    A variable is a quantity, quality, or property that you can measure.
    A value is the state of a variable when you measure it. The value of a variable may change from measurement to measurement.
    An observation is a set of measurements made under similar conditions (you usually make all of the measurements in an observation at the same time and on the same object). An observation will contain several values, each associated with a different variable. I’ll sometimes refer to an observation as a data point.
    Tabular data is a set of values, each associated with a variable and an observation. Tabular data is tidy if each value is placed in its own “cell”, each variable in its own column, and each observation in its own row.

7.3 Variation
Variation is the tendency of the values of a variable to change from measurement to measurement. 
Every variable has its own pattern of variation, which can reveal interesting information.
The best way to understand that pattern is to visualise the distribution of the variable’s values.
How you visualise the distribution of a variable will depend on whether the variable is categorical or continuous. 
    A variable is categorical if it can only take one of a small set of values.
        To examine the distribution of a categorical variable, use a bar chart:
    A variable is continuous if it can take any of an infinite set of ordered values.
        To examine the distribution of a continuous variable, use a histogram:
            A histogram divides the x-axis into equally spaced bins and then uses the height of a bar to display the number of observations that fall in each bin

7.3.2 Typical Values
To turn bar chart/histogram information into useful questions, look for anything unexpected:

    Which values are the most common? Why?
    Which values are rare? Why? Does that match your expectations?
    Can you see any unusual patterns? What might explain them?            

7.3.3 Unusual Values
Outliers are observations that are unusual; data points that don’t seem to fit the pattern. 
It’s good practice to repeat your analysis with and without the outliers. 
    If they have minimal effect on the results, and you can’t figure out why they’re there, it’s reasonable to replace them with missing values, and move on. 
        However, if they have a substantial effect on your results, you shouldn’t drop them without justification. 
            You’ll need to figure out what caused them (e.g. a data entry error) 

7.4 Missing Values:


7.5 covariation
If variation describes the behavior within a variable, covariation describes the behavior between variables.
Covariation is the tendency for the values of two or more variables to vary together in a related way.
The best way to spot covariation is to visualise the relationship between two or more variables.
7.5.1 A categorical and coninuous variable
Boxplot: 
    A box that stretches from the 25th percentile of the distribution to the 75th percentile, a distance known as the interquartile range (IQR). 
        In the middle of the box is a line that displays the median, i.e. 50th percentile, of the distribution. 
            These three lines give you a sense of the spread of the distribution and whether or not the distribution is symmetric about the median or skewed to one side.
7.6 Patterns and models
Patterns in your data provide clues about relationships. 
If a systematic relationship exists between two variables it will appear as a pattern in the data. 
If you spot a pattern, ask yourself:

    Could this pattern be due to coincidence (i.e. random chance)?
    How can you describe the relationship implied by the pattern?
    How strong is the relationship implied by the pattern?
    What other variables might affect the relationship?
    Does the relationship change if you look at individual subgroups of the data?

Patterns provide one of the most useful tools for data scientists because they reveal covariation.
If you think of variation as a phenomenon that creates uncertainty, covariation is a phenomenon that reduces it.
If two variables covary, you can use the values of one variable to make better predictions about the values of the second.
Models are a tool for extracting patterns out of data.

7.7 ggplot2 calls:
Typically, the first one or two arguments to a function are so important that you should know them by heart. 
    The first two arguments to ggplot() are data and mapping, and the first two arguments to aes() are x and y. e.g.,

        ggplot(data = faithful, mapping = aes(x = eruptions)) + 
            geom_freqpoly(binwidth = 0.25)

    Rewriting the previous plot more concisely yields:

        ggplot(faithful, aes(eruptions)) + 
            geom_freqpoly(binwidth = 0.25)