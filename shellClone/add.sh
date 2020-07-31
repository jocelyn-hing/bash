#!/bin/dash

#check that usage is correct 
if [[$1 = ""]]
then
    echo "usage: legit-add <filenames>"
    exit 1
fi
#check that .legit exists
if [ ! -e .legit] 
then 
    echo "legit-add: error: no .legit directory containing legit repository exists."
    exit 1
fi
if
then 
    if [! "-d index"] 
    then 
        mkdir index
fi

#then move all the files into the index directory. 
for FILE in "$@"
do
    cp $FILE /index
done