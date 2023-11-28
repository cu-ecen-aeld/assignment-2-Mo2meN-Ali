#!/bin/bash

# Check the number of arguments

if [ $# -lt 2 ]; then
    echo "invalid number of arguments, must be 2!"
    exit 1
fi

cd $1

fCounter=0
strCounter=0

for file in $(ls); do
    ((++fCounter))
    if [ -d $file ]; then # subdirectory?
        ((fCounter+=$(cd $file && ls | wc -l)))
        ((strCounter+=$(cd $file && grep $2 * | wc -l)))
    else
        ((strCounter+=$(grep $2 $file | wc -l)))
    fi
done

echo "The number of files are $fCounter"
echo "and the number of matching lines are $strCounter"
exit 0 # Success!