#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Invalid number of arguments, must be 2!"
    exit 1
fi

IFS="/" # Shell internal field separator
read -ra writefile <<< $1 # Break the input into string-subsets array
IFS=" "

writestr=$2
file=0

cd /  # Access the root directory
for file in ${writefile[@]}; do
    if [[ -d $file ]]; then # If it exists already!
        cd $file    # Access it!
    elif [[ $file != *.* ]]; then # If it is a directory and not a file
        mkdir $file # Create it!
        cd $file    # Then acces
    fi    
done

if [ -f $file ]; then # File exists?
    echo $writestr > $file # Overwrite the file's contents
else
    touch $file 
    echo $writestr > $file # Overwrite the file's contents
fi