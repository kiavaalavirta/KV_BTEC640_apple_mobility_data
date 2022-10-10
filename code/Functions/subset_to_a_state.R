# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular US state
# and then write out a cvs file that only has that subset.

# Kia Vaalavirta
# kavaalavirta@dons.usfca.edu
# September 17, 2022

# load packages
library("dplyr")
library("readr")

# create a function to subset any US state out of the full data set
# by also creating an output CSV file named based on the state
subset_to_a_state <- function(input_file_name,
                              state_name) {
  # read in the complete csv file
  all_covid_data <- readr::read_csv(input_file_name)

  # subset the dataset just to the state of our choosing
  state_dataset <- all_covid_data %>%
    dplyr::filter(`sub-region` == state_name)

  # sanitize state names with spaces and replace them with underscores
  state_no_spaces <- gsub(state_name, pattern = " ", replacement = "_")

  # check that the subsetted data actually has data in it
  if (nrow(state_dataset) == 0)  {
    stop("ERROR: No rows matching given state name. Did you make a typo?")
}

  # save the subsetted state data to a new csv file in the output directory
  readr::write_csv(state_dataset, file = paste0("output/subsetted_states_wide/",
                                        tools::file_path_sans_ext(
                                          basename(input_file_name)),
                                        "_",
                                        state_no_spaces,
                                        ".csv"))
}
