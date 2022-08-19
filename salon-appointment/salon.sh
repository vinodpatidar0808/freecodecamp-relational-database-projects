#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~"

LIST_OF_SERVICES=$($PSQL "SELECT * FROM services;")

MAIN_MENU(){

  if [[ $1 ]]
  then 
    echo -e "\n$1"
  else
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi

  # display list of services 
  echo "$LIST_OF_SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # take the service id from user
  read SERVICE_ID_SELECTED

  # if not a valid service send to main menu 
  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-5]$ ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    # if valid ask for appoint details like phone number, time, etc
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # check if phone number exist in customer records
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_ID ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
      # get customer id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    else 
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id =$CUSTOMER_ID")
    fi
    # get service name from selected service id
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME

    # book appointment
    BOOK_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED,'$SERVICE_TIME');")
    if [[ $BOOK_APPOINTMENT = "INSERT 0 1" ]]
    then
      echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    fi

  fi
}

MAIN_MENU
