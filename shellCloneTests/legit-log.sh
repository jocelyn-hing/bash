#!/bin/dash

#legit-log, by z5191165
#Tuesday 3pm Alex Linker 
#14 July 2019 
#a program that prints one line for every commit that has been made to the repository with the commit number and message.

#check if .legit directory exists 
if [ ! -e .legit ]
then
    echo "legit-log: error: no .legit directory containing legit repository exists"
    exit 1
fi
#check if commit directory exists 
if [ ! -d .legit/commit ]
then 
    echo "legit-log: error: your repository does not have any commits yet"
    exit 1
fi
#check right usage
if [ "$#" -gt 1 ]
then    
    echo "usage: legit-log"
    exit 1
fi

for FILE in .legit/commit/commit_*.txt
do
    cat $FILE
done
exit 0