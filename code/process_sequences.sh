#!/bin/bash

# A bash script to parse SARS-CoV-2 sequence data using Linux tools
# We are parsing the sequence data to find out more about its properties

# Kia Vaalavirta
# October 28, 2022
# kavaalavirta@dons.usfca.edu

# check to make sure there is exactly one command-line argument
if [ $# -ne 1 ]
 then
   echo "To run this script, supply one argument."
   echo "The argument is the path to a compressed fasta file."
   exit 1
 fi

# path to the compressed fasta file as a command-line argument
path=$1

# show the first 10 lines of the data to peek into its structure
zcat "$1" | head -n 10
echo "First 10 lines of the data are displayed."

#The first sequence found by its name
zgrep ">NC_045512.2" "$1"
echo "This is the first sequence."

#show the first ten sequence names and comments
bioawk -c fastx '{print $name $comment}' "$1" | head -n 10
echo "These are the first ten sequence names with comments."

# return a count of the sequences in the file
zgrep -oE "^>" "$1" | wc -l
echo "This is the number of sequences in the file."

# return a count of sequences from China
bioawk -c fastx '/China/ {print $name}' "$1" | wc -l
echo "This is the number of sequences from China."

# tally up the number of SARS-CoV-2 sequences in the dataset from each country
# and sort them from most to least sequences
zgrep ">" "$1" | cut -d '|' -f 21 | sort | uniq -c | sort -r -k1 -n
echo This is the number of sequences from each country.
