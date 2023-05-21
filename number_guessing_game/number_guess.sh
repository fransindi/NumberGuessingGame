#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

VALIDATOR=0
while [[ $VALIDATOR = 0 ]]
do
  echo "Enter your username:"
  read USERNAME
  if [ ${#USERNAME} -gt 22 ]
  then
    echo "Your username must be 22 characteres or less"
  else
    VALIDATOR=1
  fi
done

CHECK_USERNAME () {
  CHECK_USER=$($PSQL "select * from users where username='$USERNAME'")
  if [[ $CHECK_USER ]]
  then
    GAMES_PLAYED=$($PSQL "select games_played from users where username='$USERNAME'")
    BEST_GAME=$($PSQL "select min(g.guesses) from users u join games g on u.user_id = g.user_id where u.username='$USERNAME'")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

   
  else
    echo "Welcome, $USERNAME! It's look like this is your first time here."
    INSERT_USERNAME=$($PSQL "insert into users(username, games_played) values('$USERNAME', 0)")
    
  fi
  GUESS_GAME
}

GUESS_GAME() {
  echo 'Guess the secret number between 1 and 1000:'
  read INPUT
  RANDOM_NUMBER=$((RANDOM % 1000 + 1))
  GUESSES=0
  while [[ $INPUT != $RANDOM_NUMBER ]]
  do
    GUESSES=$((GUESSES + 1)) 
    if [[ $INPUT =~ ^[0-9]*$ ]]
    then
      if [[ $INPUT < $RANDOM_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
        read INPUT
      elif [[ $INPUT > $RANDOM_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
        read INPUT
      fi
    else
      echo "That is not an integrer, guess again:"
      read INPUT
    fi
  done
  echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
  USER_ID=$($PSQL "select user_id from users where username='$USERNAME'")
  INSERT_GAME=$($PSQL "insert into games(user_id, guesses) values($USER_ID, $GUESSES)")
  NUMBER_GAMES=$($PSQL "select count(*) from games g join users u on g.user_id = u.user_id where u.user_id=$USER_ID")
  UPDATE_USER_GAMES=$($PSQL "update users set games_played='$NUMBER_GAMES' where user_id=$USER_ID")
}


CHECK_USERNAME




