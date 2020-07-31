#TEST 1


###TESTING LEGIT-* BEFORE LEGIT-INIT###


#removes previous directory if it exists
rm -rf .legit

#testing legit-commit with no arguments 
./legit-add
#expected output "legit-add: error: no .legit directory containing legit repository exists."

#------------

#testing legit-add 
touch a b
./legit-add a b
# expected output "legit-add: error: no .legit directory containing legit repository exists."

#------------

#testing legit-commit with no arguments 
./legit-commit 
# expected output  "legit-commit: error: no .legit directory containing legit repository exists"

#------------

#testing legit-commit
./legit-commit -m 'before legit-init'
# expected output  "legit-commit: error: no .legit directory containing legit repository exists"

#------------

#testing legit-log
./legit-log
# expected output "legit-log: error: no .legit directory containing legit repository exists"

#------------

#testing legit-show with no arguments 
./legit-show 
# expected output "legit-show: error: no .legit directory containing legit repository exists"

#------------

#testing legit-show calling index
./legit-show :a 
# expected output "legit-show: error: no .legit directory containing legit repository exists"

#------------

#testing legit-show calling a commit 
./legit-show 0:a 
# expected output "legit-show: error: no .legit directory containing legit repository exists"

#------------


###TESTING LEGIT-INIT###


#reset directory
rm -rf .legit

#testing initilising legit-init with arguments
./legit-init.sh random 123 
# expected output "usage: legit-init"

#------------

#testing initilising legit-init
./legit-init.sh
# expected output "Initialized empty legit repository in .legit"

#------------

#testing initilising legit-init when .legit exists
./legit-init.sh
# expected output "legit-init: error: .legit already exists"

#------------

#testing legit-init with arguments after it has been initilised
./legit-init.sh random 123 
# expected output "usage: legit-init"

#------------
