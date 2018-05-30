library(httr)
library(jsonlite)
library(dplyr)
library(stringr)
library(ggplot2)
library(data.table)
library(treemap)
# load in data set
personalities <- read.csv(file = "BIG5/data.csv", header=TRUE, sep="",
                          stringsAsFactors = F)
# dataset containing just other info
other_info <- personalities[, c("race", "age", "engnat", "gender", "hand", "source", "country")]
# what is the average age of survey takers?
under_30 <- nrow(filter(other_info, age < 30))


# make dataframe listing unique countries and frequency
unique_countries <- unique(other_info$country)
num_each_country <- sapply(unique_countries, class) == 'character'
value <- group_by(personalities, country) %>% 
  summarise(count=n())
value[1, 1] = "NA"
            

# treemap of different countries participants represent
treemap(value,
        index="country",
        vSize="count",
        type="index"
)

