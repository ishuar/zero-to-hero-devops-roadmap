#!/usr/bin/env bash

number=10

## Basic If statement

if [ "$number" -lt 15 ]; then
  echo "The number is less than 15"
fi

## Advance if..elif..else statement

if [ "$number" -gt 15 ]; then
  echo "The number is greater than 15"
elif [ "$number" -gt 5 ] && [ "$number" -lt 15 ]; then
  echo "The number is greater than 5 but less than or equal to 15"
else
  echo "The number is 5 or less"
fi

## Nested if..else statement

if [ "$number" -gt 15 ]; then
  echo "The number is greater than 15"
else
  if [ "$number" -lt 10 ]; then
    echo "The number is less than 10"
  elif [ "$number" -eq 10 ]; then
    echo "The Number is equal to 10"
  else
    echo "The Number is not greater than 15 and not number 10"
  fi
fi
