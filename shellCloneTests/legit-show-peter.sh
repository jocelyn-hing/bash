#!/bin/dash

# Check if .legit (commit_log) exists
if ! test -d .legit; then
    echo "legit-show: error: no .legit directory containing legit repository exists"
    exit 1
fi

# Check if commits have been made
test -f .legit/commit_log
commit_flag="$?"
if [ $commit_flag -eq 1 ]; then
    echo "legit-show: error: your repository does not have any commits yet"
    exit 1
fi

# Invalid Usage
if [ "$#" -eq 0 ] || [ "$#" -gt 1 ]; then
    echo "usage: legit-show <commit>:<filename>"
    exit 1
fi

# Invalid Object
echo "$1" | grep -o ":"
valid_flag="$?"
if [ $valid_flag -ne 0 ]; then
    echo "legit-show: error: invalid object $1"
    exit 1
fi

# Assign user input to variables 'commit' and 'file_name'
commit=`echo "$1" | cut -d':' -f1`
file_name=`echo "$1" | cut -d':' -f2`

# Check if files exist in index
echo "$1" | sed 's/ //' | cut -c1 | egrep -o ":"
if [ $? -eq 0 ]; then
    test -f .legit/index/$file_name 
    if [ $? -ne 0 ]; then   
        echo "legit-show: error: '$file_name' not found in index"
        exit 1
    else
        # If file exists in index
        cat .legit/index/$file_name
        exit 0
    fi
fi


# Unknown Commit
test -d .legit/objects/$commit
if [ $? -ne 0 ]; then
    echo "legit-show: error: unknown commit '$commit'"
    exit 1
fi

# Invalid FileName in commit
file_name=`echo "$1" | cut -d':' -f2`
test -f .legit/objects/$commit/$file_name
if [ $? -ne 0 ]; then
    echo "legit-show: error: '$file_name' not found in commit $commit"
    exit 1
fi

# Print from specified commit.file
cat .legit/objects/$commit/$file_name

# EXIT SUCCESS
exit 0