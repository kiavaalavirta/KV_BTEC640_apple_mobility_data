# Analysis of Apple Mobility Data in the Era of COVID-19

Kia Vaalavirta  
kavaalavirta@dons.usfca.edu

The aim of this project is to analyze the mobility data made available by Apple.

The data isn't available anymore. Apple stopped releasing the data 04/12/2022.

Currently, it uses dplyr to work with tabular data. It also includes use of ggplot2 to visualize the data set.

### Change Log

* 22-09-02: data subsetted for Ohio.
* 22-09-27: Refactor the code to be able to subset any state from the larger file.
* 22-09-21: Add git infrastructure to project and push to GitHub
* 22-09-24: Create a second script file in the pipeline using dplyr and modifying the scripts to use for loop to tally up the city and county counts in given states with different transportation types
* 22-09-25: Create a function of the second script and loops for first and second script files to collect data of 5 chosen states
* 22-09-25: lintr check subset to state function file
* 22-10-09: Create wide to long function. Create analysis R markdown file to combine information and create graphs.
