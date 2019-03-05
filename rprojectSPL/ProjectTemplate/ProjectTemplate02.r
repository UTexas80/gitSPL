# Create project
library('ProjectTemplate')
create.project('PhilaPD')
#shift into the relevant directory, move our database over and uncompress it
# $ cd PhilaPD
# $ mv ~/Downloads/philapd.db.zip data
# $ unzip data/philapd.db.zip -d data
# $ rm data/philapd.db.zip
# reload R and load the project
getwd()
# Load the project
# setwd("..")
# setwd("PhilaPD")
library('ProjectTemplate')
load.project()

# Unit Testing Your Project
stub.tests()
test.project()

?data.table