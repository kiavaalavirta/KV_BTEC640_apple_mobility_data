# Kia Vaalavirta
# October 9, 2022
# kavaalavirta@dons.usfca.edu

# load needed packages
library("tidyr")
library("readr")
library("dplyr")

# create a function to change the data from wide to long for any state
# by also creating an output CSV file named based on the state
convert_wide_to_long <- function(file_name_in) {

  # read in the complete csv file
  input_data <- readr::read_csv(file_name_in)

  # change the data from wide to long for the specific state
  date_order <- input_data %>%
    pivot_longer(
      cols = starts_with("20"),
      names_to = "date",
      values_to = "rel_mobility")

  # save the data to a new csv file in the "subsetted_states_long" directory.
  readr::write_csv(date_order, file = paste0("output/subsetted_states_long/",
                                             tools::file_path_sans_ext(
                                               basename(file_name_in)),
                                             "_long",
                                             ".csv"))
}
