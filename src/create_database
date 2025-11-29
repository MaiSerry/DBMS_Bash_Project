#!/user/bin/bash

# get commant from user
echo "Enter your command: "
read -r line

# split commant into words
set -- $line
count=$#
db_name=$3

# check if the commant is validate or not
if [[ "$count" -ne 3 ]]
then
  echo invalid syntax, try agian
# check key words of creation
elif [[ "$1" == "create" && "$2" == "database" ]]
then
# check name of the database
  if [[ $db_name =~ ^[a-zA-Z][A-Za-z0-9_-]*$ ]]
  then
    if [[ -d "./dbms/$db_name"  ]]
    then
      echo database already exists, choose another name
    else
      mkdir ./dbms/$db_name 2>/dev/null
      touch ./dbms/$db_name/$db_name.meta 2>/dev/null
      echo database created successfully
    fi
  else
    echo invalid name db
  fi
else
  echo check your syntax
fi

