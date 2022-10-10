# Kia Vaalavirta
# October 9, 2022
# kavaalavirta@dons.usfca.edu

# create a function to change the data from wide to long
convert_wide_to_long <- function(file_name_in) {
  library("tidyr")
  library("readr")
  library("dplyr")

  input_data <- readr::read_csv(file_name_in)
  date_order <- input_data %>%
    pivot_longer(
      cols = starts_with("20"),
      names_to = "date",
      values_to = "rel_mobility")

readr::write_csv(date_order, file = paste0("output/subsetted_states_long/",
                                           tools::file_path_sans_ext(
                                             basename(file_name_in)),
                                           "_long",
                                           ".csv"))
}


# test out the use of the function
convert_wide_to_long(
  file_name_in =
    "output/subsetted_states_wide/applemobilitytrends-2022-04-12_Alabama.csv")
