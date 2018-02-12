# Load the project
library("ProjectTemplate"); load.project()

# Clear the workspace
rm(list=ls())

# List Installed Packages
ip = as.data.frame(installed.packages()[,c(1,3:4)])
ip = ip[is.na(ip$Priority),1:2,drop=FALSE]
ip