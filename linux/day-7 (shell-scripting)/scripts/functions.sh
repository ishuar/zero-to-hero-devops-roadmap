#!/usr/bin/env bash

## Globals variables
separator="---------------------------------------------------"

## Better output visualisation.
echo "$separator"


function welcome_01 {
  echo "welcome to zero to hero devops roadmap github repository"
  echo "function definition using function keyword"
}

## Use function name to use it
welcome_01

echo "$separator"

welcome_02 () {
  echo "welcome to zero to hero devops roadmap github repository"
  echo "function definition using function name following ()"
}

## Use function name to use it
welcome_02

echo "$separator"

## Function with positional arguments
function welcome {
  echo "Welcome to $1 $2 repository"
  echo "function definition using arguments"
}

## function_name first_argument second_argument [[ and so on ]]
welcome "zero to hero devops roadmap" "github"

echo "$separator"
