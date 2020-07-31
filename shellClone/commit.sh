#!/bin/dash

#commits must have messages as part of commit comment 

#check if .legit directory exists 
if [[ ! -e .legit ]]
    echo "git-commit: error: no .legit directory containing legit repository exists"
    exit 1
fi
#check first argument is -m flag
if [[ "$1" ! eq "-m" ]]
then
    echo "legit-commit [-a] -m commit-message"
    exit 1
fi
#check that second argument exists.
if [[ "$#" lt 2 ]]
then 
    echo "legit-commit [-a] -m commit-message"
    exit 1
fi

#check that there is a commit log
# i dont think you need to check, i think you can just write the first line. 
if [[ ! -e commit-log.txt]]
then
    commit_number = wc -l commit-log.txt
    echo "$2" > commit-log.txt 
    #save commit message nd number to the log
    #you could probably create the commit number based on the line

if [[ ! -e .legit/backup ]]
then 
    mkdir ./legit/backup
fi

for FILE in index/.*
do
    cp $FILE .legit/backup/
done
#save the commit to a text file... 

#saves copy of all files in index to repo

#In the commit you need to remember the files moved, the commit number, and the commit message 

echo "Committed as commit $commit_number"

