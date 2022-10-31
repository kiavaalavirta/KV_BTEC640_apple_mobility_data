#!/bin/bash

# A bash script to parse SARS-CoV-2 sequence data using Linux tools

# Kia Vaalavirta
# October 28, 2022
# kavaalavirta@dons.usfca.edu

# path to a single compressed fasta file as a command-line argument
filepath=$1

# check to make sure there is exactly one command-line argument
if [ $# -ne 1 ]
 then
   echo "To run this script, supply one argument."
   echo "The argument is the path to a compressed fasta file."
   exit 1
 fi

# show the first 10 lines of the data to peek into its structure
zcat $1 | head -n 10
echo "First 10 lines of the data are displayed."

#The first sequence found by its name
zgrep ">NC_045512.2" $1
echo "This is the first sequence."

#show the first ten sequence names and comments
bioawk -c fastx '{print $name $comment}' $1 | head -n 10
echo "These are the first ten sequence names with comments."

# return a count of the sequences in the file
zgrep -oE "^>" $1 | wc -l
echo "This is the number of sequences in the file."

# return a count of sequences from China
bioawk -c fastx '/China/ {print $name}' $1 | wc -l
echo "This is the number of sequences from China."

