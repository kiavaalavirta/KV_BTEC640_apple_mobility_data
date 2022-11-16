#!/bin/bash

# A bash script to parse SARS-CoV-2 sequence data using Linux tools
# We are parsing the sequence data to find out more about its properties

# Kia Vaalavirta
# October 28, 2022
# kavaalavirta@dons.usfca.edu

# add code to make sure that all commands in pipelines run
set -eou pipefail

# give the path to the compressed fasta file as a command-line argument
# check to make sure there is exactly one command-line argument
if [ $# -ne 1 ]
 then
   echo "To run this script, supply one argument."
   echo "The argument is the path to a compressed fasta file."
   exit 1
 fi

# return a count of the sequences in the file
zgrep -oE "^>" "$1" | wc -l
echo "This is the number of sequences in the file."

# tally up the number of SARS-CoV-2 sequences in the dataset from each country
# and sort them from most to least sequences
zgrep ">" "$1" | cut -d '|' -f 21 | sort | uniq -c | sort -r -k1 -n
echo "This is the number of sequences from each country."
echo "The countries are sorted from most to least sequences."
