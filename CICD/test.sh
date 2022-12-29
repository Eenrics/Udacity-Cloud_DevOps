#!/bin/bash

# using [ expression ] syntax and in place 
# of File.txt you can write your file name 
if [ -f "File.txt" ]; 
then

# if file exist the it will be printed 
echo "File is exist"
cat File.txt
else

# is it is not exist then it will be printed
echo "File is not exist"
return 1
fi
