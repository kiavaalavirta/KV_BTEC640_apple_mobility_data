# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from Ohio
# and then write out a cvs file that only has that subset.

# Kia Vaalavirta
# kavaalavirta@dons.usfca.edu
# September 2, 2022
# Updated October 9, 2022

# read in the complete csv file
all_covid_data <- read.csv("data/raw data/applemobilitytrends-2022-04-12.csv")

# subset the dataset to only include rows where the sub.region column has
# "Ohio" in it but we want all columns.
ohio_data <- all_covid_data[all_covid_data$sub.region == "Ohio", ]

# save the Ohio data to a new csv file in the output directory.
write.csv(ohio_data, file = "output/ohio_apple_mobility_data.csv")
