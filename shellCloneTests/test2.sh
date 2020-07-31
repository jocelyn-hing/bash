#TEST 2

#reset directory
rm -rf .legit
./legit-init

###TESTING LEGIT-* BEFORE LEGIT-ADD, BUT AFTER LEGIT-INIT ###

#testing legit-commit with no arguments 
./legit-commit 
# expected output "legit-commit [-a] -m commit-message"

#------------

#testing legit-commit with no message
./legit-commit -m
# expected output "legit-commit [-a] -m commit-message"

#------------

#testing legit-commit with no -m flag
./legit-commit hello
# expected output "legit-commit [-a] -m commit-message"

#------------

#testing legit-commit with correct arguments 
./legit-commit -m "testing testing 123"
# expected output "nothing to commit"

#------------

#testing legit-log with arguments 
./legit-log hello
# expected output legit-log: error: your repository does not have any commits yet

#------------

#testing legit-log
./legit-log
# expected output legit-log: error: your repository does not have any commits yet

#------------

#testing legit-show with no arguments 
./legit-show 
# expected output legit-show: error: your repository does not have any commits yet

#------------

#testing legit-show calling index 
./legit-show :a 
# expected output legit-show: error: your repository does not have any commits yet

#------------

#testing legit-show calling commit
./legit-show 0:a 
# expected output legit-show: error: your repository does not have any commits yet

#------------

#testing legit-show with more than one argument 
./legit-show hello world 
# expected output legit-show: error: your repository does not have any commits yet

#------------

### TESTING LEGIT-ADD


#testing legit-add with no arguments 
rm -rf .legit
./legit-init
./legit-add
# expected output usage: legit-add <filenames>

#------------

#testing legit-add with one argument
rm -rf .legit
./legit-init
touch a
./legit-add a

#------------

#testing legit-add with more than one argument 
rm -rf .legit
./legit-init
touch a b
./legit-add a b

#------------

#testing legit-add with invalid files 
rm -rf .legit
./legit-init
./legit-add c
# expected output usage: legit-add: error: can not open 'c'

#------------

#testing legit-add with valid and invalid files 
rm -rf .legit
./legit-init
touch a 
./legit-add a c
# expected output usage: legit-add: error: can not open 'c'

#------------


### TESTING LEGIT-* BEFORE LEGIT-COMMIT


rm -rf .legit
./legit-init
touch a 
./legit-add a 

#testing legit-log
./legit-log
# expected output legit-log: error: your repository does not have any commits yet

#------------

#testing legit-log with arguments
./legit-log hello world
# expected output legit-log: error: your repository does not have any commits yet

#------------

#testing legit-show 
./legit-show 
# expected output legit-show: error: your repository does not have any commits yet

#------------

#testing legit-show with calling commits 
./legit-show 0:a 
# expected output legit-show: error: your repository does not have any commits yet

#------------

#testing legit-show with calling index 
./legit-show :a 
# expected output legit-show: error: your repository does not have any commits yet

#------------


