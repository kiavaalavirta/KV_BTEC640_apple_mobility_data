#!/bin/bash

# A bash script to drive the rendering of an Rmarkdown file using some
# parameters passed in from the shell
# this script expects two command line parameters
# the first should be a US state, and the second is the raw apple mobility
# data csv file downloaded from apple.com

# Kia Vaalavirta  
# October 18, 2022
# kavaalavirta@dons.usfca.edu

if [ $# -eq 0 ]
then 
  echo "To run this script, supply two arguments:"
  echo "The first is the name of the US state."
  echo "The second is the path to the mobility data csv file"
  exit 1
fi

state=$1
state=${state// /_}

Rscript -e "rmarkdown::render('analysis.Rmd',\
            params = list(state = '$1',\
            data = '$2'),\
            output_dir = 'output',\
            output_file = 'analysis_$state')"
