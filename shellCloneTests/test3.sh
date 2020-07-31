#TEST 3


### TESTING LEGIT-COMMIT


#setting up 
rm -rf .legit
./legit-init
touch a b
./legit-add a b

#testing input without -m flag
./legit-commit 'testing without -m flag'
#expected output "legit-commit [-a] -m commit-message"

#------------

#testing input without commit message
./legit-commit -m
#expected output "legit-commit [-a] -m commit-message"

#------------

#testing more than two arguments 
./legit-commit -m hello world
#expected output "legit-commit [-a] -m commit-message"

#------------

#testing with an empty index
rm -rf .legit
./legit-init
touch a b
./legit-commit

#------------

#testing first commit with one file
rm -rf .legit
./legit-init
touch a 
./legit-add a  
./legit-commit -m "first commit"
./legit-show 0:a
#------------

#testing second commit with one file 
./legit-add c 
./legit-commit -m "second commit"
./legit-show 1:c

#------------

#testing with files that have the same name but are different versions 

echo "thick thighs save lives" >> a 
./legit-add a
./legit-commit -m "updated a file"
./legit-show 2:a

#------------

# testing  first commit with multiple files 
rm -rf .legit
./legit-init
touch a b
./legit-add a b 
./legit-commit -m "first commit"
./legit-show 0:a
./legit-show 0:b

#------------

#testing second commit with multiple files 

touch c d 
./legit-add c d
./legit-commit -m "second commit"
./legit-show 1:c
./legit-show 1:d 

#------------
