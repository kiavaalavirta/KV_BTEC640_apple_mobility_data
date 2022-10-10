# the goal of this script is to use the dplyr package to count the
# number of cities and counties in a given state that have detailed
# Apple mobility data available and then eventually save it to a csv

# Kia Vaalavirta
# September 24, 2022
# kavaalavirta@dons.usfca.edu

# load function
source("code/functions/cities_counties_by_state.R")

# creating a for loop to get data for all 5 states chosen
cities_counties_by_state(file_name_in = paste0("output/subsetted_states_wide/",
                         "applemobilitytrends-2022-04-12_Alabama.csv"))
