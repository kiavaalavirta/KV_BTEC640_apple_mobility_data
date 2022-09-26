# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular US state
# and then write out a cvs file that only has that subset
# uses functions in the code/function directory

# Kia Vaalavirta
# kavaalavirta@dons.usfca.edu
# September 17, 2022

# load functions
source("code/functions/subset_to_a_state.R")

# test out the use of the function
subset_to_a_state(
  input_file_name = "data/raw_data/applemobilitytrends-2022-04-12.csv",
  state_name = "Hawaii")
