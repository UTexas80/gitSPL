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