# In Listing 2-4 , we are going to point R to a directory containing .csv files of stock prices. We will check
# to see whether the directory contains files with names equal to the vector S with .csv concatenated to it. We
# will then load the nonmatched files with the Yahoo! Finance API. On the first run-through, all of the files will
# be missing, and they will all be loaded.

# Listing 2-4 also contains a mechanism for checking whether we supplied any invalid stock symbols to R
# in the character vector S . These will be stored as an R object after execution if the program discovers that the
# stock has no data in the Yahoo! Finance API. This will help prevent unnecessary API calls in future runs. If
# the S&P 500 has not been modified since the time of writing, the invalid vector should remain empty.

# Load "invalid.R" file if available
invalid <- character(0)
setwd(rootdir)
if("invalid.R" %in% list.files ()) source ("invalid.R", echo=TRUE)

# Find all symbols not in directory and not missing
setwd(datadir)
toload <- setdiff(S[!paste0(S, ".csv") %in% list.files()], invalid)

# Fetch symbols with quandl function (instead of yahoo), save as .csv or missing
source(paste0(srcdir, "quandl.R"))

if(length(toload) != 0){
  for(i in 1:length(toload)){

  df <- quandl_get(toload[i])

  if(!is.null(df)) {
    write.csv(df[nrow(df):1], file = paste0(toload[i], ".csv"),
              row.names = FALSE)
  } else {
    invalid <- c(invalid, toload[i])
  }

}
}

# setwd(rootdir)
# dump(list = c("invalid"), "invalid.R")