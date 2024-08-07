#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Please provide an element as an argument." >echo "Please provide an element as an argument."2 >echo "Please provide an element as an argument."2
  exit 0
fi

# Database credentials
DB_NAME="periodic_table"
DB_USER="freecodecamp"

# Argument passed to the script
ARGUMENT=$1

# Query to fetch element details
ELEMENT_QUERY="SELECT elements.atomic_number, elements.name, elements.symbol, properties.atomic_mass, types.type, properties.melting_point_celsius, properties.boiling_point_celsius 
               FROM elements 
               JOIN properties ON elements.atomic_number = properties.atomic_number 
               JOIN types ON properties.type_id = types.type_id 
               WHERE elements.atomic_number::text = '$ARGUMENT' OR elements.symbol = '$ARGUMENT' OR elements.name = '$ARGUMENT'"

# Execute query
ELEMENT_DETAILS=$(psql -U "$DB_USER" -d "$DB_NAME" -t --no-align -c "$ELEMENT_QUERY")

# Check if the element was found
if [ -z "$ELEMENT_DETAILS" ]; then
  echo "I could not find that element in the database."
  exit 0
fi

# Parse and display the element details
IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL ATOMIC_MASS TYPE MELTING_POINT BOILING_POINT <<< "$ELEMENT_DETAILS"

echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
# This script queries the periodic table database
# This script queries the periodic table database
# This script queries the periodic table database
# TODO: Add unit tests
