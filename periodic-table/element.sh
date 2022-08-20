#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# check if an argument exist or not 
if [[ $1 ]]
then
  # check if argument is number
  if [[ $1 =~ ^[0-9]+$ ]] 
  then 
    ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = '$1' ;")
  else
    ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1' OR name = '$1' ;")
  fi

  # check for ELEMENT  if exist print it else print the message
  if [[ -z $ELEMENT ]]
  then 
    echo -e "I could not find that element in the database."
  else
    echo "$ELEMENT" | while IFS=" | " read ATOMIC_NUMBER NAME SYMBOL TYPE MASS MP BP
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
    done
  fi
  # if there is no argument print msg
else
  echo -e "Please provide an element as an argument."
fi
