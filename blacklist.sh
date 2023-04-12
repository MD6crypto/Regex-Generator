#!/bin/bash

echo "Enter the sus domain you want to blacklist (e.g. example.com):"

read input

# Basic validation

if [[ ! $input =~ ^[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}$ ]]; then

  echo "Invalid domain name."

  exit 1

fi

# Generate regex rule with options

echo "Adding regex rule to blacklist $input..."

printf "/\b${input//./\\.}\b/ \n"

read -p "Additional regex options (press enter for none): " options

if [[ $options != "" ]]; then

  echo -n "$options"

fi

echo "d"
