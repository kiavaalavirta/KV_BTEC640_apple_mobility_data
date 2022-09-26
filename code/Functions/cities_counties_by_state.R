# the goal of this script is to use the dplyr package to count the
# number of cities and counties in a given state that have detailed
# Apple mobility data available and then eventually save it to a csv

# Kia Vaalavirta
# September 24, 2022
# kavaalavirta@dons.usfca.edu

# load the package "dplyr"
library("dplyr")

# we want to get a count of the number of cities and the
# number of counties in a given state that have driving mobility
# data. The input to this will be the output of the previous script
# namely the state csv files that were already subsetted

# create a function to subset any US state out of the full data set
cities_counties_by_state <- function(input_file_name) {
  # read in the complete csv file
  state_data <- read.csv(input_file_name)

  # using dplyr chains to count cities and counties by type
  count_cities_counties_type <- state_data %>%
    select(geo_type, region, transportation_type) %>%
    group_by(geo_type, transportation_type) %>%
    tally()

  # check that the data pipeline has data in it
  if (nrow(state_data) == 0) {
    stop("ERROR: No rows to match state name. Did you make a typo?")
  }

  # write out the result of the dplyr chain
  write.csv(count_cities_counties_type, file = paste0("output/",
                                                      tools::file_path_sans_ext(
                                                        basename(
                                                          input_file_name)),
                                                      "_",
                                                      "cities_counties_counts",
                                                      ".csv"))
}
