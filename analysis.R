library(httr)
library(jsonlite)
library(dplyr)
library(stringr)
# load in data set
personalities <- read.csv(file = "BIG5/data.csv", header=TRUE, sep="",
                          stringsAsFactors = F)

# what is the average age of survey takers?
under_30 <- nrow(filter(personalities, age < 30))
# what is the percentage of females?

# plotly big circle on contry lab

personalities$race