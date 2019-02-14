#!/bin/bash

HOST=$(hostname --fqdn)
SHELL=$(which bash)

function menu {
   echo -e 'Main menu: '
   echo -e '1. Create user'
   echo -e '2. Display user information'
   echo -e '3. Delete user'
   echo -e '4. Exit'
   read -e WYBOR

   case ${WYBOR} in
     1) main ;;
     2) display ;;
     3) deleting_user ;;
     4) echo "Exiting now..."; sleep 2; exit 0; ;;
     *) echo "Choose valid option from Main menu"; menu ;;
   esac
}

function main {
    # checking if the script is used with root privileges
    if [[ ${UID} -eq 0 ]]; then
    echo -e 'Creating user accounts script. Type login name, description of account and initial password.\n'
    sleep 1
    echo "What's the name of the account?:  "
    read -e NAME
    echo "Type description of the account:  "
    read -e DESCRIBE
    echo "Initial password of the account:  "
    read -e PASS
    echo -e
    # create user function
    create_user
    echo 'Returning to main menu..'; sleep 3; clear;
    menu
  else
    # displaying error message and exits.
    echo "You are not root user. Use root priviliges using sudo or switch to user account."
    sleep 3
    exit 0
  fi
}

function create_user {
  # this function creates user account with description and creates placeholder password
  useradd ${NAME} -c "${DESCRIBE}" -s ${SHELL}
  echo "${NAME}:${PASS}" | chpasswd
  passwd -e ${NAME} >/dev/null
}

function display {
  # this function displays information we were provided in creating process
  echo -e "Account informations: \n"
  echo -e "Hostname: ${HOST} "
  echo -e "Name: ${NAME} "
  echo -e "Description: ${DESCRIBE} "
  echo -e "Password: ${PASS} "
  echo -e "Default shell: "

  sleep 2; clear
  # clearing variables for next use
  NAME=""
  DESCRIBE=""
  PASS=""
  # returning to main menu
  menu
}

function deleting_user {
  # delete user we've created in this script
  if getent passwd tester > /dev/null 2>&1; then
    userdel tester
    echo 'User tester deleted.'
    sleep 2; clear; menu
  else
    echo "The user tester doesn't exist"
    sleep 2; clear; menu
  fi
}

menu
