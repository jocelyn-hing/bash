#!/bin/dash

#legit-add, by z5191165
#Tuesday 3pm Alex Linker 
#10 July 2019 

#check that usage is correct 
if [ "$#" -lt 1 ]
then
    echo "usage: legit-add <filenames>"
    exit 1
fi
#check that .legit exists
if [ ! -e .legit ] 
then 
    echo "legit-add: error: no .legit directory containing legit repository exists"
    exit 1
fi
cd .legit
if [ ! -e index ] 
then 
        mkdir index
fi
cd ..
#check all files exist 
for NAME in "$@"
do
    if [ ! -e $NAME ] 
    then
        echo "legit-add: error: can not open '$NAME'"
        exit 1
    fi
done
#then move all the files into the index directory. 
for FILE in "$@"
do
    cp $FILE .legit/index
done
exit 0 

