#!/bin/bash

# Define a variable for the PSQL command with specific flags for output formatting.
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if the user has provided an argument. If not, display an error message.
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # Check if the argument is a number (atomic number).
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # Query the database for an element with the given atomic number.
    ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
  else
    # Query the database for an element with the given name or symbol.
    ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1' OR symbol='$1'")
  fi

  # If no element is found, display an error message.
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    # If an element is found, process and display the details.
    echo $ELEMENT | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
  fi
fi
