#!/bin/dash

#legit-commit, by z5191165
#Tuesday 3pm Alex Linker 
#11 July 2019 
#a program that saves a copy of all files in the index file and moves them to the repo file. 

TMP_FILE1=/tmp/legit_commit_tmp1$$
TMP_FILE2=/tmp/legit_commit_tmp2$$

#check if .legit directory exists 
if [ ! -e .legit ]
then
    echo "legit-commit: error: no .legit directory containing legit repository exists"
    exit 1
fi

#check first argument is -m flag
if [ "$1" != "-m" ]
then
    echo "legit-commit [-a] -m commit-message"
    exit 1
fi

#check that second argument exists.
if [ "$#" -ne 2 ]
then 
    echo "legit-commit [-a] -m commit-message"
    exit 1
fi

#check that index exists 
if [ ! -e .legit/index ]
then 
    echo "nothing to commit"
    exit 0
fi
#check that index isn't empty 
index_counter=0
for INDEX_FILE in .legit/index
do  
    index_counter=$((index_counter+1))
done
if [ $index_counter -eq 0 ]
then 
    echo "nothing to commit"
    exit 0
fi
#check that there is a commit directory 
if [ ! -e .legit/commit ]
then
    # if commit directory doesn't exist, make commit directory.
    mkdir .legit/commit
fi
#checks that there is a master directory 
if [ ! -e .legit/master ]
then 
    mkdir .legit/master
    mkdir .legit/commit/commit_0 
    #moves first files from index to master
    file_counter=0
    for FILE in .legit/index/*
    do
        cp $FILE .legit/master
        cp $FILE .legit/commit/commit_0
        echo 0 $2 > .legit/commit/commit_0.txt
        echo "Committed as commit 0"
        exit 0
    done
else 
    #check how many commits how many there have been to give a commit number
    commit_number=0
    for FILE in .legit/commit/*.txt 
    do
        commit_number=$((commit_number+1))
    done

    mkdir .legit/commit/commit_$commit_number

    for FILE1 in .legit/master/*
    do 
        for FILE2 in .legit/index/*
        #checking that the files with the same names are different 
        #taken from lecture code 
        do
            file_name1=` echo "$FILE1" | rev | cut -d'/' -f1 | rev `
            file_name2=` echo "$FILE2" | rev | cut -d'/' -f1 | rev `

            if [ "$file_name1" = "$file_name2" ]
            then
                sed 's/\/\/.*//' $FILE1 >$TMP_FILE1
                sed 's/\/\/.*//' $FILE2 >$TMP_FILE2
                if [ ` ! diff -i -w $TMP_FILE1 $TMP_FILE2 >/dev/null ` ]
                then   
                    cp $FILE2 .legit/commit/commit_$commit_number/
                    cp $FILE2 .legit/master/
                    echo $commit_number $2 > .legit/commit/commit_$commit_number.txt
                    rm -f $TMP_FILE1 $TMP_FILE2
                fi
            # new files are added to master.
            elif [ ! -e .legit/master/$FILE2 ]
            then 
                cp $FILE2 .legit/commit/commit_$commit_number/
                cp $FILE2 .legit/master/
                echo $commit_number $2 > .legit/commit/commit_$commit_number.txt
            else   
                continue 
            fi
        done
    done 
    
fi

#check if the new commit directory is empty
if [ ! -e .legit/commit/commit_$commit_number.txt ]
then 
    echo "nothing to commit"
    rm -rf .legit/commit/commit_$commit_number
    exit 0
else 
    echo "Committed as commit $commit_number"
    exit 0
fi


