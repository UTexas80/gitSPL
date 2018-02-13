# https://cran.r-project.org/web/packages/ProjectTemplate/ProjectTemplate.pdf
# Add any project specific configuration here.
# Access this information using config$...

root      =   rprojroot::find_rstudio_root_file()
atdir     =   file.path(root, "AutoTrading//")
cachedir  =   file.path(root, "cache//")
datadir   =   file.path(root, "data//")
libdir    =   file.path(root, "lib//")
srcdir    =   file.path(root, "src//")


add.config(
    mainDir = ".",
    subDir  = "AutoTrading",
    compute = "./Platform/compute/",
    data    = "./Platform/stockdata/",
    functions = "./Platform/functions/",
    load    = "./Platform/load/",
    model    = "./Platform/model/",
    plan    = "./Platform/plan/",
    root = root,
    atdir = atdir,
    cachedir = cachedir,
    datadir = datadir,
    libdir = libdir,
    srcdir = srcdir,
    isUNIX = FALSE,
    maxAssets = 10,
    workers = 4,
    quandl_api = "ZtvE2BmA_dxMQvnn_mWU",
    urlSP500 = "http://trading.chrisconlan.com/SPstocks.csv"
)
