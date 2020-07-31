#!/bin/dash

#legit-show, by z5191165
#Tuesday 3pm Alex Linker 
#14 July 2019 
#a program that prints the contents of a specified file as of the speficied commit

#check if .legit directory exists 
if [ ! -e .legit ]
then
    echo "legit-show: error: no .legit directory containing legit repository exists"
    exit 1
fi

#check number of arguments 
if [ "$#" -ne 1 ] 
then 
    echo "usage: legit-show <commit>:<filename>"
    exit 1
fi

# check right argument 
echo "$1" | grep -o ":"
check_colon="$?"
if [ $check_colon -ne 0 ]; then
    echo "legit-show: error: invalid object $1"
    exit 1
fi
#check if commit directory exists 
test -d .legit/commit 
if [ $? -ne 0 ]
then 
    echo "legit-show: error: your repository does not have any commits yet"
    exit 1
fi

file_name=` echo "$1" | rev | cut -d':' -f1 | rev `
commit_number=` echo "$1" | cut -d':' -f1 `


# #check valid file name 
echo "$filename" | grep -o [^a-zA-Z0-9.-_] 
file_name_check=$?
if [ $file_name_check -ne 0 ]
then
    echo "legit:show: error: invalid file name '$1' "
fi 

echo "$1" | sed 's/ //' | cut -c1 | egrep -o ":"
if [ $? -eq 0 ]
then
    test -f .legit/index/$file_name 
    if [ $? -ne 0 ]
    then   
        echo "legit-show: error: '$file_name' not found in index"
        exit 1
    else
        cat .legit/index/$file_name
        exit 0
    fi
fi

#check if the commit number exists 
test -d .legit/commit/commit_$commit_number
if [ $? -ne 0 ]
then
    echo "legit-show: error: unknown commit '$commit_number' "
    exit 1 
fi

#check if the file exists in the commit 
test -f .legit/commit/commit_$commit_number/$file_name
if [ $? -ne 0 ]
then
    echo "legit-show: error: '$file_name' not found in commit $commit"
    exit 1
fi

cat .legit/commit/commit_$commit_number/$file_name
exit 0
 
