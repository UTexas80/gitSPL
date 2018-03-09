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

###############################################################################
8. Workflow: projects
###############################################################################

8.1 What is real?
    Keyboard shortcuts:
        
        1. Press Cmd/Ctrl + Shift + F10 to restart RStudio.
        2. Press Cmd/Ctrl + Shift + S to rerun the current script.

8.2 Where does your analysis live?
    Working directory:
        This is where R looks for files that you ask it to load, and where it will put any files that you ask it to save. 
            RStudio shows your current working directory at the top of the console:

8.3 Paths and directories:
    Paths and directories are a little complicated because there are two basic styles of paths: Mac/Linux and Windows. There are three chief ways in which they differ:
        1. The most important difference is how you separate the components of the path. 
            Mac and Linux uses slashes  (e.g. plots/diamonds.pdf) and 
            Windows uses backslashes    (e.g. plots\diamonds.pdf)
        2. Absolute paths (i.e. paths that point to the same place regardless of your working directory) look different. 
            In Windows they start with a drive letter (e.g. C:) or two backslashes (e.g. \\servername) and in Mac/Linux they start with a slash “/” (e.g. /users/hadley). 
            You should never use absolute paths in your scripts, because they hinder sharing: no one else will have exactly the same directory configuration as you.
        3. The last minor difference is the place that ~ points to. ~ is a convenient shortcut to your home directory. 
            Windows doesn’t really have the notion of a home directory, so it instead points to your documents directory.


8.5 Summary

In summary, RStudio projects give you a solid workflow that will serve you well in the future:

    Create an RStudio project for each data analysis project.
    Keep data files there; we’ll talk about loading them into R in data import.
    Keep scripts there; edit them, run them in bits or as a whole.
    Save your outputs (plots and cleaned data) there.
    Only ever use relative paths, not absolute paths.

Everything you need is in one place, and cleanly separated from all the other projects that you are working on.

###############################################################################
9. Wrangle: Introduction
###############################################################################

Data wrangling: 
    the art of getting your data into R in a useful form for visualisation and modelling. 
    There are three main parts to data wrangling:
        1. Import
        2. Tidy
        3. Transform
    The major components of data wrangling include:
        1. tibbles: variant of the data frame
        2. data import: 
        3. tidy data: a consistent way of storing your data that makes transformation, visualisation, and modelling easier.
    Data wrangling also encompasses data transformation. 
        Focus on four specific types of data you will frequently encounter in practice:
        1. Relational data will give you tools for working with multiple interrelated datasets.
        2. Strings will introduce regular expressions, a powerful tool for manipulating strings.
        3. Factors are how R stores categorical data. They are used when a variable has a fixed set of possible values, or when you want to use a non-alphabetical ordering of a string.
        4. Dates and times will give you the key tools for working with dates and date-times.

###############################################################################
10. Tibbles
###############################################################################

10.2 Creating tibbles: 
    Most other R packages use regular data frames, so you might want to coerce a data frame to a tibble. You can do that with as_tibble()
    You can create a new tibble from individual vectors with tibble(). 
    If you’re already familiar with data.frame(), note that tibble() does much less: 
        1. it never changes the type of the inputs (e.g. it never converts strings to factors!), 
        2. it never changes the names of variables, and 
        3. it never creates row names.
    It’s possible for a tibble to have column names that are not valid R variable names, aka non-syntactic names. 
        For example, 
            they might not start with a letter, or 
            they might contain unusual characters like a space. 
        To refer to these variables, you need to surround them with backticks, `: e.g., `:)` = "smile",
            You’ll also need the backticks when working with these variables in other packages, like ggplot2, dplyr, and tidyr.
    tribble():
        Another way to create a tibble is with tribble(), short for transposed tibble. 
        tribble() is customised for data entry in code: column headings are defined by formulas (i.e. they start with ~), and entries are separated by commas. 
        This makes it possible to lay out small amounts of data in easy to read form, e.g.:

        tribble(
             ~x, ~y, ~z,
            #--|--|----
            "a", 2, 3.6,
            "b", 1, 8.5
        )

        I often add a comment (the line starting with #), to make it really clear where the header is.

10.3 Tibbles vs. data.frame
    There are two main differences in the usage of a tibble vs. a classic data.frame: printing and subsetting.
    10.3.1 Printing:
        Tibbles have a refined print method that shows only the first 10 rows, and all the columns that fit on screen. 
            This makes it much easier to work with large data. 
            In addition to its name, each column reports its type, a nice feature borrowed from str():
    10.3.2 Subsetting:
        So far all the tools you’ve learned have worked with complete data frames. 
            If you want to pull out a single variable, you need some new tools, $ and [[. 
                [[ can extract by name or position; 
                $ only extracts by name but is a little less typing.
                    # Extract by name
                        df$x
                        df[["x"]]
                    # Extract by position
                        df[[1]]
                To use these in a pipe, you’ll need to use the special placeholder .:
                    # Extract by name
                        df %>% .$x
                    # Extract by position
                        df %>% .[["x"]]
        Compared to a data.frame, tibbles are more strict: they never do partial matching, and they will generate a warning if the column you are trying to access does not exist.
    10.4 Interacting with older code
        Some older functions don’t work with tibbles. If you encounter one of these functions, use as.data.frame() to turn a tibble back to a data.frame:

###############################################################################
11. Data import
###############################################################################

11.2 Getting started

Most of readr’s functions are concerned with turning flat files into data frames:

    read_csv() reads comma delimited files, read_csv2() reads semicolon separated files (common in countries where , is used as the decimal place), read_tsv() reads tab delimited files, and read_delim() reads in files with any delimiter.
    read_fwf() reads fixed width files. You can specify fields either by their widths with fwf_widths() or their position with fwf_positions(). read_table() reads a common variation of fixed width files where columns are separated by white space.
    read_log() reads Apache style log files. (But also check out webreadr which is built on top of read_log() and provides many more helpful tools.)

The first argument to read_csv() is the most important: it’s the path to the file to read.

heights <- read_csv("data/heights.csv")


11.2.1 Compared to base R

If you’ve used R before, you might wonder why we’re not using read.csv(). There are a few good reasons to favour readr functions over the base equivalents:

    They are typically much faster (~10x) than their base equivalents. 
        Long running jobs have a progress bar, so you can see what’s happening. 
            If you’re looking for raw speed, try data.table::fread(). 
                It doesn’t fit quite so well into the tidyverse, but it can be quite a bit faster.
    They produce tibbles, they don’t convert character vectors to factors, use row names, or munge the column names. 
        These are common sources of frustration with the base R functions.
    They are more reproducible. 
        Base R functions inherit some behaviour from your operating system and environment variables, so import code that works on your computer might not work on someone else’s.

11.3 Parsing a vector

Before we get into the details of how readr reads files from disk, we need to take a little detour to talk about the parse_*() functions. 
    These functions take a character vector and return a more specialised vector like a logical, integer, or date:

    str(parse_logical(c("TRUE", "FALSE", "NA")))
    #>  logi [1:3] TRUE FALSE NA
    str(parse_integer(c("1", "2", "3")))
    #>  int [1:3] 1 2 3
    str(parse_date(c("2010-01-01", "1979-10-14")))
    #>  Date[1:2], format: "2010-01-01" "1979-10-14"

Like all functions in the tidyverse, the parse_*() functions are uniform: the first argument is a character vector to parse, and the na argument specifies which strings should be treated as missing:


11 Data import
11.1 Introduction

Working with data provided by R packages is a great way to learn the tools of data science, but at some point you want to stop learning and start working with your own data. In this chapter, you’ll learn how to read plain-text rectangular files into R. Here, we’ll only scratch the surface of data import, but many of the principles will translate to other forms of data. We’ll finish with a few pointers to packages that are useful for other types of data.
11.1.1 Prerequisites

In this chapter, you’ll learn how to load flat files in R with the readr package, which is part of the core tidyverse.

library(tidyverse)

11.2 Getting started

Most of readr’s functions are concerned with turning flat files into data frames:

    read_csv() reads comma delimited files, read_csv2() reads semicolon separated files (common in countries where , is used as the decimal place), read_tsv() reads tab delimited files, and read_delim() reads in files with any delimiter.

    read_fwf() reads fixed width files. You can specify fields either by their widths with fwf_widths() or their position with fwf_positions(). read_table() reads a common variation of fixed width files where columns are separated by white space.

    read_log() reads Apache style log files. (But also check out webreadr which is built on top of read_log() and provides many more helpful tools.)

These functions all have similar syntax: once you’ve mastered one, you can use the others with ease. For the rest of this chapter we’ll focus on read_csv(). Not only are csv files one of the most common forms of data storage, but once you understand read_csv(), you can easily apply your knowledge to all the other functions in readr.

The first argument to read_csv() is the most important: it’s the path to the file to read.

heights <- read_csv("data/heights.csv")
#> Parsed with column specification:
#> cols(
#>   earn = col_double(),
#>   height = col_double(),
#>   sex = col_character(),
#>   ed = col_integer(),
#>   age = col_integer(),
#>   race = col_character()
#> )

When you run read_csv() it prints out a column specification that gives the name and type of each column. That’s an important part of readr, which we’ll come back to in parsing a file.

You can also supply an inline csv file. This is useful for experimenting with readr and for creating reproducible examples to share with others:

read_csv("a,b,c
1,2,3
4,5,6")
#> # A tibble: 2 × 3
#>       a     b     c
#>   <int> <int> <int>
#> 1     1     2     3
#> 2     4     5     6

In both cases read_csv() uses the first line of the data for the column names, which is a very common convention. There are two cases where you might want to tweak this behaviour:

    Sometimes there are a few lines of metadata at the top of the file. You can use skip = n to skip the first n lines; or use comment = "#" to drop all lines that start with (e.g.) #.

    read_csv("The first line of metadata
      The second line of metadata
      x,y,z
      1,2,3", skip = 2)
    #> # A tibble: 1 × 3
    #>       x     y     z
    #>   <int> <int> <int>
    #> 1     1     2     3

    read_csv("# A comment I want to skip
      x,y,z
      1,2,3", comment = "#")
    #> # A tibble: 1 × 3
    #>       x     y     z
    #>   <int> <int> <int>
    #> 1     1     2     3

    The data might not have column names. You can use col_names = FALSE to tell read_csv() not to treat the first row as headings, and instead label them sequentially from X1 to Xn:

    read_csv("1,2,3\n4,5,6", col_names = FALSE)
    #> # A tibble: 2 × 3
    #>      X1    X2    X3
    #>   <int> <int> <int>
    #> 1     1     2     3
    #> 2     4     5     6

    ("\n" is a convenient shortcut for adding a new line. You’ll learn more about it and other types of string escape in string basics.)

    Alternatively you can pass col_names a character vector which will be used as the column names:

    read_csv("1,2,3\n4,5,6", col_names = c("x", "y", "z"))
    #> # A tibble: 2 × 3
    #>       x     y     z
    #>   <int> <int> <int>
    #> 1     1     2     3
    #> 2     4     5     6

Another option that commonly needs tweaking is na: this specifies the value (or values) that are used to represent missing values in your file:

read_csv("a,b,c\n1,2,.", na = ".")
#> # A tibble: 1 × 3
#>       a     b     c
#>   <int> <int> <chr>
#> 1     1     2  <NA>

This is all you need to know to read ~75% of CSV files that you’ll encounter in practice. You can also easily adapt what you’ve learned to read tab separated files with read_tsv() and fixed width files with read_fwf(). To read in more challenging files, you’ll need to learn more about how readr parses each column, turning them into R vectors.
11.2.1 Compared to base R

If you’ve used R before, you might wonder why we’re not using read.csv(). There are a few good reasons to favour readr functions over the base equivalents:

    They are typically much faster (~10x) than their base equivalents. Long running jobs have a progress bar, so you can see what’s happening. If you’re looking for raw speed, try data.table::fread(). It doesn’t fit quite so well into the tidyverse, but it can be quite a bit faster.

    They produce tibbles, they don’t convert character vectors to factors, use row names, or munge the column names. These are common sources of frustration with the base R functions.

    They are more reproducible. Base R functions inherit some behaviour from your operating system and environment variables, so import code that works on your computer might not work on someone else’s.

11.2.2 Exercises

    What function would you use to read a file where fields were separated with
    “|”?

    Apart from file, skip, and comment, what other arguments do read_csv() and read_tsv() have in common?

    What are the most important arguments to read_fwf()?

    Sometimes strings in a CSV file contain commas. To prevent them from causing problems they need to be surrounded by a quoting character, like " or '. By convention, read_csv() assumes that the quoting character will be ", and if you want to change it you’ll need to use read_delim() instead. What arguments do you need to specify to read the following text into a data frame?

    "x,y\n1,'a,b'"

    Identify what is wrong with each of the following inline CSV files. What happens when you run the code?

    read_csv("a,b\n1,2,3\n4,5,6")
    read_csv("a,b,c\n1,2\n1,2,3,4")
    read_csv("a,b\n\"1")
    read_csv("a,b\n1,2\na,b")
    read_csv("a;b\n1;3")

11.3 Parsing a vector

Before we get into the details of how readr reads files from disk, we need to take a little detour to talk about the parse_*() functions. These functions take a character vector and return a more specialised vector like a logical, integer, or date:

str(parse_logical(c("TRUE", "FALSE", "NA")))
#>  logi [1:3] TRUE FALSE NA
str(parse_integer(c("1", "2", "3")))
#>  int [1:3] 1 2 3
str(parse_date(c("2010-01-01", "1979-10-14")))
#>  Date[1:2], format: "2010-01-01" "1979-10-14"

These functions are useful in their own right, but are also an important building block for readr. Once you’ve learned how the individual parsers work in this section, we’ll circle back and see how they fit together to parse a complete file in the next section.

Like all functions in the tidyverse, the parse_*() functions are uniform: the first argument is a character vector to parse, and the na argument specifies which strings should be treated as missing:

parse_integer(c("1", "231", ".", "456"), na = ".")
#> [1]   1 231  NA 456

If parsing fails, you’ll get a warning:

x <- parse_integer(c("123", "345", "abc", "123.45"))
#> Warning: 2 parsing failures.
#> row col               expected actual
#>   3  -- an integer                abc
#>   4  -- no trailing characters    .45

And the failures will be missing in the output:

x
#> [1] 123 345  NA  NA
#> attr(,"problems")
#> # A tibble: 2 × 4
#>     row   col               expected actual
#>   <int> <int>                  <chr>  <chr>
#> 1     3    NA             an integer    abc
#> 2     4    NA no trailing characters    .45

If there are many parsing failures, you’ll need to use problems() to get the complete set. This returns a tibble, which you can then manipulate with dplyr.

Using parsers is mostly a matter of understanding what’s available and how they deal with different types of input. There are eight particularly important parsers:

    parse_logical() and parse_integer() parse logicals and integers respectively. There’s basically nothing that can go wrong with these parsers so I won’t describe them here further.
    parse_double() is a strict numeric parser, and parse_number() is a flexible numeric parser. These are more complicated than you might expect because different parts of the world write numbers in different ways.
    parse_character() seems so simple that it shouldn’t be necessary. But one complication makes it quite important: character encodings.
    parse_factor() create factors, the data structure that R uses to represent categorical variables with fixed and known values.
    parse_datetime(), parse_date(), and parse_time() allow you to parse various date & time specifications. These are the most complicated because there are so many different ways of writing dates.

    11.3.1 Numbers: It seems like it should be straightforward to parse a number, but three problems make it tricky:

        People write numbers differently in different parts of the world. For example, some countries use . in between the integer and fractional parts of a real number, while others use ,.
        Numbers are often surrounded by other characters that provide some context, like “$1000” or “10%”.
        Numbers often contain “grouping” characters to make them easier to read, like “1,000,000”, and these grouping characters vary around the world.
    11.3.2 Strings
    11.3.3 Factors
    11.3.4 Dates, date-times, and times:
        You pick between three parsers depending on whether you want 
            a date (the number of days since 1970-01-01), 
            a date-time (the number of seconds since midnight 1970-01-01), or 
            a time (the number of seconds since midnight). 
    11.5 Writing to a file: readr also comes with two useful functions for writing data back to disk: write_csv() and write_tsv(). 
        Both functions increase the chances of the output file being read back in correctly by:
            Always encoding strings in UTF-8.
            Saving dates and date-times in ISO8601 format so they are easily parsed elsewhere.
        If you want to export a csv file to Excel, use write_excel_csv() — 
            this writes a special character (a “byte order mark”) at the start of the file which tells Excel that you’re using the UTF-8 encoding.
        CSV''s are little unreliable for caching interim results—
            you need to recreate the column specification every time you load in. There are two alternatives:
                write_rds() and read_rds() are uniform wrappers around the base functions readRDS() and saveRDS(). 
                    These store data in R’s custom binary format called RDS:

###############################################################################
12. Tidy data
###############################################################################

12.1 Introduction

Tidy data: a consistent way to organise your data in R
    Once you have tidy data and the tidy tools provided by packages in the tidyverse, 
        you will spend much less time munging data from one representation to another, 
            allowing you to spend more time on the analytic questions at hand.

12.2 Tidy data
    You can represent the same underlying data in multiple ways.
        There are three interrelated rules which make a dataset tidy:
            1. Each variable must have its own column.
            2. Each observation must have its own row.
            3. Each value must have its own cell.
        These three rules are interrelated because it’s impossible to only satisfy two of the three. That interrelationship leads to an even simpler set of practical instructions:
            1. Put each dataset in a tibble.
            2. Put each variable in a column.
        Why ensure that your data is tidy? There are two main advantages:
            1. There’s a general advantage to picking one consistent way of storing data. 
                If you have a consistent data structure, it’s easier to learn the tools that work with it because they have an underlying uniformity.
            2. There’s a specific advantage to placing variables in columns because it allows R’s vectorised nature to shine. 
                As you learned in mutate and summary functions, most built-in R functions work with vectors of values. 
                    That makes transforming tidy data feel particularly natural.
12.3 Spreading and gathering
The principles of tidy data seem so obvious that you might wonder if you’ll ever encounter a dataset that isn’t tidy. 
    Unfortunately, however, most data that you will encounter will be untidy. There are two main reasons:
        1. Most people aren’t familiar with the principles of tidy data, and it’s hard to derive them yourself unless you spend a lot of time working with data.
        2. Data is often organised to facilitate some use other than analysis. For example, data is often organised to make entry as easy as possible.
    This means for most real analyses, you’ll need to do some tidying. 
        The first step is always to figure out what the variables and observations are. 
            Sometimes this is easy; other times you’ll need to consult with the people who originally generated the data. 
        The second step is to resolve one of two common problems:
            1. One variable might be spread across multiple columns.
            2. One observation might be scattered across multiple rows.
        Typically a dataset will only suffer from one of these problems; it’ll only suffer from both if you’re really unlucky! 
            To fix these problems, you’ll need the two most important functions in tidyr: 
            1. gather() and 
                a. gather() makes wide tables narrower and longer
            2. spread().
                a. spread() makes long tables shorter and wider.
12.4 Separating and uniting
    12.4.1 Separate: 
        separate() pulls apart one column into multiple columns, by splitting wherever a separator character appears.
            By default, separate() will split values wherever it sees a non-alphanumeric character (i.e. a character that isn’t a number or letter). 
                 If you wish to use a specific character to separate a column, you can pass the character to the sep argument of separate().
                    (Formally, sep is a regular expression, which you’ll learn more about in strings.)
                        You can use this arrangement to separate the last two digits of each year.
                            table3 %>% separate(year, into = c("century", "year"), sep = 2)
    12.4.2 Unite:
        unite() is the inverse of separate(): it combines multiple columns into a single column.
            e.g., We can use unite() to rejoin the century and year columns 
                table5 %>% unite(new, century, year, sep = "")
    12.5 Missing values:
       Changing the representation of a dataset brings up an important subtlety of missing values. Surprisingly, a value can be missing in one of two possible ways:
            1. Explicitly, i.e. flagged with NA.
            2. Implicitly, i.e. simply not present in the data.
        One way to think about the difference is with this Zen-like koan: 
            An explicit missing value is the presence of an absence; 
            an implicit missing value is the absence of a presence
        Another important tool for making missing values explicit in tidy data is complete()
            complete() takes a set of columns, and finds all unique combinations. 
                It then ensures the original dataset contains all those values, filling in explicit NAs where necessary
        You can fill in missing values with fill(). 
            It takes a set of columns where you want missing values to be replaced by the most recent non-missing value (sometimes called last observation carried forward).
 
###############################################################################
13. Relational data
###############################################################################

13.1 Introduction:
    To work with relational data you need verbs that work with pairs of tables.
        There are three families of verbs designed to work with relational data:

            1. Mutating joins, which add new variables to one data frame from matching observations in another.
            2. Filtering joins, which filter observations from one data frame based on whether or not they match an observation in the other table.
            3. Set operations, which treat observations as if they were set elements.

    Generally, dplyr is a little easier to use than SQL because dplyr is specialised to do data analysis: 
        it makes common data analysis operations easier, at the expense of making it more difficult to do other things that aren’t commonly needed for data analysis.

13.3 Keys:
    The variables used to connect each pair of tables are called keys. A key is a variable (or set of variables) that uniquely identifies an observation.
    There are two types of keys:
        1. A primary key uniquely identifies an observation in its own table.
            For example, planes$tailnum is a primary key because it uniquely identifies each plane in the planes table.
        2. A foreign key uniquely identifies an observation in another table.
            For example, the flights$tailnum is a foreign key because it appears in the flights table where it matches each flight to a unique plane.
    If a table lacks a primary key, it’s sometimes useful to add one with mutate() and row_number().
        This is called a surrogate key
    A primary key and the corresponding foreign key in another table form a relation. Relations are typically one-to-many

13.4 Mutating joins:
     A mutating join allows you to combine variables from two tables.
        It first matches observations by their keys, then copies across variables from one table to the other.
            Like mutate(), the join functions add variables to the right, so if you have a lot of variables already, the new variables won’t get printed out.

13.4.1 Understanding joins:
    A join is a way of connecting each row in x to zero, one, or more rows in y

13.4.2 Inner join
    The simplest type of join is the inner join. An inner join matches pairs of observations whenever their keys are equal
    The output of an inner join is a new data frame that contains the key, the x values, and the y values. We use 'by' to tell dplyr which variable is the key:
        x %>% 
            inner_join(y, by = "key")
    The most important property of an inner join is that unmatched rows are not included in the result.
        This means that generally inner joins are usually not appropriate for use in analysis because it’s too easy to lose observations.

13.4.3 Outer joins:

    An inner join keeps observations that appear in both tables. An outer join keeps observations that appear in at least one of the tables. 
        There are three types of outer joins:

            1. A left join keeps all observations in x.
            2. A right join keeps all observations in y.
            3. A full join keeps all observations in x and y.

    The most commonly used join is the left join:
        you use this whenever you look up additional data from another table, because it preserves the original observations even when there isn’t a match.
            The left join should be your default join: use it unless you have a strong reason to prefer one of the others.

13.4.4 Duplicate keys:
    There are two possibilities:
        1. One table has duplicate keys. This is useful when you want to add in additional information as there is typically a one-to-many relationship.
        2. Both tables have duplicate keys. This is usually an error because in neither table do the keys uniquely identify an observation.
            When you join duplicated keys, you get all possible combinations, the Cartesian product:

13.4.5 Defining the key columns:
    You can use other values for by to connect the tables in other ways:
        1. The default, by = NULL, uses all variables that appear in both tables, the so called natural join.
            For example, the flights and weather tables match on their common variables: year, month, day, hour and origin.
                flights2 %>% 
                    left_join(weather)
        2. A character vector, by = "x". This is like a natural join, but uses only some of the common variables.
            flights2 %>% 
                left_join(planes, by = "tailnum")
        3. A named character vector: by = c("a" = "b"). 
            This will match variable a in table x to variable b in table y. 
                The variables from x will be used in the output.
                    flights2 %>% 
                        left_join(airports, c("dest" = "faa"))
                    flights2 %>% 
                        left_join(airports, c("origin" = "faa"))


13.4.7 Other implementations

    base::merge() can perform all four types of mutating join:
        dplyr 	            merge
        inner_join(x, y) 	merge(x, y)
        left_join(x, y) 	merge(x, y, all.x = TRUE)
        right_join(x, y) 	merge(x, y, all.y = TRUE),
        full_join(x, y) 	merge(x, y, all.x = TRUE, all.y = TRUE)

    The advantages of the specific dplyr verbs is that they more clearly convey the intent of your code: 
    the difference between the joins is really important but concealed in the arguments of merge(). 
    dplyr’s joins are considerably faster and don’t mess with the order of the rows.

    SQL is the inspiration for dplyr’s conventions, so the translation is straightforward:
    dplyr 	                    SQL
    inner_join(x, y, by = "z") 	SELECT * FROM x INNER JOIN y USING (z)
    left_join(x, y, by = "z") 	SELECT * FROM x LEFT OUTER JOIN y USING (z)
    right_join(x, y, by = "z") 	SELECT * FROM x RIGHT OUTER JOIN y USING (z)
    full_join(x, y, by = "z") 	SELECT * FROM x FULL OUTER JOIN y USING (z)

    SQL supports a wider range of join types than dplyr because you can connect the tables using constraints other than equality (sometimes called non-equijoins).

13.5 Filtering joins:

    Filtering joins match observations in the same way as mutating joins, but affect the observations, not the variables. There are two types:

        1. semi_join(x, y) keeps all observations in x that have a match in y.
        2. anti_join(x, y) drops all observations in x that have a match in y.

    Semi-joins are useful for matching filtered summary tables back to the original rows. For example, imagine you’ve found the top ten most popular destinations:

        top_dest <- flights %>%
            count(dest, sort = TRUE) %>%
            head(10)    
    
    Now you want to find each flight that went to one of those destinations. You could construct a filter yourself:
        
        flights %>% 
            filter(dest %in% top_dest$dest)

    The inverse of a semi-join is an anti-join. An anti-join keeps the rows that don’t have a match:
        Anti-joins are useful for diagnosing join mismatches. 