# the goal of this script is to convert subsetted data of any state
# that has Apple mobility data available from wide to long
# and display relative mobility in the new csv file that is saved
# in output/subsetted_states_long directory

# Kia Vaalavirta
# October 9, 2022
# kavaalavirta@dons.usfca.edu

# load functions
source("code/functions/subset_to_a_state.R")

# run the function for given state
convert_wide_to_long(
  file_name_in =
    "output/subsetted_states_wide/applemobilitytrends-2022-04-12_Alabama.csv")
