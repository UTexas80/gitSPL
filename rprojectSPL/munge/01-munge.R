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

browser()                                                                       # Set Debugger

rootdir <- rprojroot::find_rstudio_root_file()
datadir <- file.path(rootdir, "data//")
libdir  <- file.path(rootdir, "lib//")
srcdir  <- file.path(rootdir, "src//")

mainDir <- "."
subDir <- "AutoTrading"
atdir  <- file.path(rootdir, "AutoTrading")

# delete AutoTrading folder if exists. We will start fresh
# if(file.exists("./AutoTrading")) {                                            # Original Code

if(dir.exists(file.path(mainDir, subDir))) {
# if(dir.exists(atdir)) {
#   unlink("./AutoTrading", recursive=TRUE)                                    # Original Code
#    unlink(file.path(mainDir, subDir), recursive=TRUE)
   unlink(atdir, recursive=TRUE)
}
# create AutoTrading folders

dir.create("./AutoTrading")
dir.create("./AutoTrading/stockdata")
dir.create("./Autotrading/functions")

####Listing 2.1: Setting Path Variables
# rootdir <- "~/Autotrading"
atdir <- file.path(rootdir, "AutoTrading//")
datadir <- "./AutoTrading/stockdata/"
functiondir <- "./AutoTrading/functions/"
####
