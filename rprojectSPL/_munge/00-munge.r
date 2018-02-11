# browser()                                                                       # Set Debugger

# Access this information using config$keep_bigdata
DIR <- list ()

DIR[["root"]] <- rprojroot::find_rstudio_root_file()
DIR[["data"]] <- "./Platform/stockdata/"
DIR[["function"]] <- "./Platform/functions/"
DIR[["load"]] <- "./Platform/load/"
DIR[["compute"]] <- "./Platform/compute/"
DIR[["plan"]] <- "./Platform/plan/"
DIR[["model"]] <- "./Platform/model/"
CONFIG <- list ()

# Windows users should set to FALSE
CONFIG[["isUNIX"]] <- FALSE

# Set to the desired number of multicore
# processes. Windows users need to be conscious
# of memory requirements of these processes.
# CONFIG[["workers"]] <- 4

# Max assets to be held in simulation, optimization,
# and potentially trade execution.
CONFIG[["maxAssets"]] <- 10

# Max iterations in optimization function
# for MODEL job. All users need to be conscious of
# time constraints.
CONFIG[["maxIter"]] <- 100

# Range or scalar value of years
# to train strategy on for MODEL job
CONFIG[["y"]] <- 2017
CONFIG[["minVal"]] <- c (n1 = 1, nFact = 1, nSharpe = 1, shThresh = .01)
CONFIG[["maxVal"]] <- c (n1 = 150, nFact = 5, nSharpe = 200, shThresh = .99)
CONFIG[["PARAMnaught"]] <- c (n1 = -2, nFact = -2, nSharpe = -2, shThresh = 0)

# https://cran.r-project.org/web/packages/ProjectTemplate/ProjectTemplate.pdf
add.config(
    mainDir =   ".",
    subDir  =   "AutoTrading",
    rootdir =   rprojroot::find_rstudio_root_file(),
    atdir   =   file.path(DIR$root, "AutoTrading"),
    datadir =   file.path(DIR$root, "data//"),
    libdir  =   file.path(DIR$root, "lib//"),
    srcdir  =   file.path(DIR$root, "src//"),
    CONFIG  =   CONFIG
)

setwd (DIR[["root"]])