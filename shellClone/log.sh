#!/bin/dash

#prints one line for every commit that has been made to the repo

#needs to contain commit no and message.

if [[ ! -e commit-log.txt]]
then 
    echo "legit-log: error: your repository does not have any commits yet"
    exit 1
fi

if [["$@" gt 1]]
then    
    echo "usage: legit-log"
    exit 1
fi
cat commit-log.txt