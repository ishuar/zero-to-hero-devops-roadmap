#!/usr/bin/env bash

## Globals variables
seperator="---------------------------------------------------"

## Better output visualisation.
echo "$seperator"

#####################
# for Loop
#####################

## for loop simple version
for i in 1 2 3 4 5; do
  echo "Iteration number $i using for loop simple version"
done

echo "$seperator"

## for Loop using a range
for i in {1..5}; do
  echo "Iteration number $i using for loop with range."
done

echo "$seperator"

## for Loop using a bash array
bash_array=(1 2 3 4 5 )
for i in "${bash_array[@]}"; do
  echo "Iteration number $i using for loop with bash array."
done

echo "$seperator"

#####################
# while Loop
#####################

# print count as long as it is less than or equal to 5
count=1
while [ $count -le 5 ]; do
  echo "Count is $count using while loop"
  ((count++))
done

echo "$seperator"

#####################
# until Loop
#####################

# print count as long as it is not greater than to 5
count=1
until [ $count -gt 5 ]; do
  echo "Count is $count using until loop"
  ((count++))
done

echo "$seperator"
