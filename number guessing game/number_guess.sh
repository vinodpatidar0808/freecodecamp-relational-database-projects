#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generate random number between 1 to 1000
SECRET_NUMBER=$(( RANDOM%1000 + 1 ))

# read username from input
echo -e "\nEnter your username:"
read INPUT_USERNAME

# check username in database
USER_DATA=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$INPUT_USERNAME';")

# check if user with username exist or not 
if [[ -z $USER_DATA ]]
then
  echo "Welcome, $INPUT_USERNAME! It looks like this is your first time here."
else 
  echo "$USER_DATA" | while IFS=" | " read USERNAME GAMES_PLAYED BEST_GAME
  do 
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

# prompt user to guess a number
echo "Guess the secret number between 1 and 1000:"
read USER_GUESS
# keep guessing untill an integer is guessed
while [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
do
  echo "That is not an integer, guess again:"
  read USER_GUESS
done

# check user gusess until it matches the secret number
GUESS_COUNT=1
while [[ $USER_GUESS != $SECRET_NUMBER ]]
do 
  if [[ $USER_GUESS -gt $SECRET_NUMBER ]]
  then 
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
  read USER_GUESS
  while [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read USER_GUESS
  done
  (( GUESS_COUNT++ ))
done

# print message when user guess correctly
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

# insert user data if user does not exist
if [[ -z $USER_DATA ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$INPUT_USERNAME',1, $GUESS_COUNT);")
else
  # update user data if user already exist
  echo "$USER_DATA" | while IFS=" | " read USERNAME GAMES_PLAYED BEST_GAME
  do 
    (( GAMES_PLAYED++ ))
    if [[ $GUESS_COUNT -lt $BEST_GAME ]]
    then
      UPDATE_USER=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$GUESS_COUNT WHERE username = '$USERNAME';")
    else
      UPDATE_USER=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE username = '$USERNAME';")
    fi
  done
fi
