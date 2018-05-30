library(httr)
library(jsonlite)
library(dplyr)
library(stringr)
library(ggplot2)
library(data.table)
# load in data set
personalities <- read.csv(file = "BIG5/data.csv", header=TRUE, sep="",
                          stringsAsFactors = F)
# dataset containing just other info
other_info <- personalities[, c("race", "age", "engnat", "gender", "hand", "source", "country")]
# what is the average age of survey takers?
under_30 <- nrow(filter(other_info, age < 30))
# what is the percentage of females?

# plotly big circle on contury lab

install.packages("treemap")
library(treemap)
treemap(personalities, #Your data frame object
        index=c("race","age","country"),  #A list of your categorical variables
        vSize = "X2017",  #This is your quantitative variable
        type="index", #Type sets the organization and color scheme of your treemap
        palette = "Reds",  #Select your color palette from the RColorBrewer presets or make your own.
        title="Spending in President Obama's 2017 Budget", #Customize your title
        fontsize.title = 14 #Change the font size of the title
)

unique_countries <- unique(other_info$country)
num_each_country <- sapply(unique_countries, class) == 'character'
value <- group_by(personalities, country) %>% 
  summarise(count=n())


#data.table 1.8.0  For help type: help("data.table")

by_unique <- personalities[,list(sale=sum(sale), profit=sum(profit)), by=unique_countries]

# Create data
group= unique_countries
value=c(13,5,22)
data=data.frame(group,value)


# treemap
treemap(data,
        index="unique_countries",
        vSize="value",
        type="index"
)
