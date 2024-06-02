#!/usr/bin/env bash

## Combination of the concepts
###  1. shebang
###  2. variables
###  3. conditionals
###  4. loops
###  5. functions

## Variable
numbers=(1 2 4 5 6 8 9 10)

## Function with conditionals

function check_even_odd_number {
  if [[ $(($1 % 2)) -eq 0 ]]; then
    echo "$1 is an even number"
  else
    echo "$1 is an odd number"
  fi
}

# Using loop with function
for number in "${numbers[@]}"; do
  check_even_odd_number "$number"
done
