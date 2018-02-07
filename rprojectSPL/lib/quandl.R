quandl_get <-
function(sym, start_date = "2017-01-01") {
    require(devtools)
    require(Quandl)
    # create a vector with all lines
    tryCatch(Quandl(c(
        paste0("WIKI/", sym, ".8"),  #  Adj. Open
        paste0("WIKI/", sym, ".9"),  # Adj. High
        paste0("WIKI/", sym, ".10"), # Adj. Low
        paste0("WIKI/", sym, ".11"), # Adj. Close
        paste0("WIKI/", sym, ".12")), # Adj. Volume
        start_date = start_date,
        type = "zoo"
    ))
}
