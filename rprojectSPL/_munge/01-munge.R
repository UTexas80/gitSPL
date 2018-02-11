# Data manipulations
# Highlight and run command below do load project without munging.
# This is useful when debugging data manipulation code.
# rm(list = ls()); library(ProjectTemplate); load.project(list(munging=FALSE)) 

# It is often useful to create sets of variable names
# By convention, the list that stores these variable sets is called 'v'
# v <- list()

# https://github.com/STAT545-UBC/Discussion/issues/407
# install_github("krlmlr/here")
# library(here)
# load other packages ...

# hw_dirs <- list.files(here("hw-marking"), pattern = "^hw\\d{2}_.*")

# browser()                                                                       # Set Debugger

# Establish Directory Structure
mainDir <- "."
subDir <- "AutoTrading"

rootdir <- rprojroot::find_rstudio_root_file()
atdir   <- file.path(rootdir, subDir)
datadir <- file.path(rootdir, "data//")
libdir  <- file.path(rootdir, "lib//")
srcdir  <- file.path(rootdir, "src//")

# delete AutoTrading folder if exists. We will start fresh
if(dir.exists(file.path(atdir))){
    dir.remove(atdir)
}

# create AutoTrading folders
setwd(rootdir)
dir.create("./AutoTrading")
dir.create("./AutoTrading/stockdata")
dir.create("./Autotrading/functions")

####Listing 2.1: Setting Path Variables
stockdatadir <- "./AutoTrading/stockdata/"
functiondir <- "./AutoTrading/functions/"
####

