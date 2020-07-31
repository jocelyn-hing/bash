#!/bin/dash

#legit-init, by z5191165
#Tuesday 3pm Alex Linker 
#07 July 2019 

#add usage error 
if [ "$#" -gt 1 ]
then 
    echo "usage: legit-init"
    exit 1
fi
#checks if .legit already exists
if [ -d ".legit" ]
then
    echo "legit-init: error: .legit already exists"
    exit 1
else 
    #legit-init command creates an empty legit repositiory. 
    mkdir .legit 
    #creates a directory named .legit to store repo
    echo "Initialized empty legit repository in .legit"
    exit 0
fi