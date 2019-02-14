#!/bin/bash

# variables
DISKUSAGE=`df -hT`
UPTIME=`uptime`
PUBLIC_IP=$(curl ifconfig.co)
PRIVATE_IP=$(hostname -I | awk '{ print $3 }')

# main functions

function greeting {
  echo -e "Let's try scripting fun! \n"
  echo -e "This script displays some useful informations about your system \n\n"
}

function reading {
  echo -e "What do you want to see?:\n"
  echo -e "1. Display uptime\n"
  echo -e "2. What's my private and public ip?\n"
  echo -e "3. How much disk space i used?\n"
  echo -e "4. EXIT\n"
  read CHOICE

  case ${CHOICE} in
    1) clear; echo -e "Your machines uptime is:\n${UPTIME}" ;;
    2) clear; echo -e "Your ip addresses are:\nPrivate ip: ${PRIVATE_IP}\nPublic ip: ${PUBLIC_IP}\n" ;;
    3) clear; echo -e "Your disk usage is:\n${DISKUSAGE}" ;;
    4) clear; echo -e "Ending in 3 seconds..."; sleep 3; exit 0; ;;
    *) echo -e "Use valid option."
      ;;
  esac
}

clear
greeting
reading
