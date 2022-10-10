# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular US states
# and then write out csv files that only have the specific subsets
# uses functions in the code/function directory

# Kia Vaalavirta
# kavaalavirta@dons.usfca.edu
# September 25, 2022

# load functions
source("code/functions/subset_to_a_state.R")

# create state vector
state <- c("Alabama", "Nebraska", "California", "Nevada", "Kansas")

# run the for loop function
for (state_name in state) {
  subset_to_a_state(
    input_file_name = "data/raw_data/applemobilitytrends-2022-04-12.csv",
    state_name)
}
