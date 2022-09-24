# the goal of this script is to use the dplyr package to count the
# number of cities and counties in a given state that have detailed
# Apple mobility data available and then eventually save it to a csv

# Kia Vaalavirta
# September 24, 2022
# kavaalavirta@dons.usfca.edu

# load the package 'dplyr"
library("dplyr")

# we would like to get a count of the number of cities and the
# number of counties in a given state that have driving mobility
# data. The input to this will be the output of the previous script
# namely the state csv files that were already subsetted

# load the dataset from the previous script
input_file_name <- "output/applemobilitytrends-2022-04-12_Alaska.csv"
state_data <- read.csv(input_file_name)

# starting off with dplyr chains
count_of_cities_counties_by_transportation_type <- state_data %>% 
  select(geo_type, region, transportation_type) %>%
  group_by(geo_type, transportation_type) %>%
  tally()
  
write.csv(count_of_cities_counties_by_transportation_type,
          "output/alaska_cities_counties_counts")
