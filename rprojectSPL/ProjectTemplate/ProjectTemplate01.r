# Create project
library('ProjectTemplate')
create.project('letters')

# Load the project
setwd("letters")
library('ProjectTemplate')
load.project()

# Load libraries - config/global.dcf
# First, we have to edit the config/global.dcf file to make sure that the load_libraries setting is turned on:
# --> load_libraries: TRUE
# Second, we need to make sure that the plyr package will be loaded automatically when we run load.project(). 
# To do that, we check that the value of the libraries configuration setting contains plyr
# To stop recomputing work we've already cached, we edit our configuration file and turn munging off:
# --> munging: FALSE

# Caching data
cache('first.letter.counts')
cache('second.letter.counts')
# Now when we reload our project we see the following:
library('ProjectTemplate')
load.project()

# Run analyses
source('src/generate_plots.R')

# getwd()
# > getwd()
# "C:/Users/gfalk/Documents"
#head(letters)