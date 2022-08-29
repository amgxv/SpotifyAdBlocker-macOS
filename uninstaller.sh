#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
  printf "\nThis script needs to be run as root.\nPassword will be asked...\n"
  sudo "$0"
  exit
fi

clear
printf "\nThis script will edit your hosts file... \n"
printf "\nDo you want to continue? [y|n] \n"
read -r conf

if [[ $conf = Y ]] || [[ $conf = y ]]; then
  clear
  
  if grep -q "Spotify Ad-Block Hosts" "/private/etc/hosts"; then
    sed -i -e "/#\[Spotify Ad-Block Hosts\]/d" "/private/etc/hosts"
    while read -r line
    do
      sed -i -e "/$line/d" "/private/etc/hosts"
    done < "hosts.txt"
    
    killall mDNSResponder
    killall mDNSResponderHelper
  fi
elif [[ $conf = N ]] || [[ $conf = n ]]; then
  clear
  exit 0
else
	printf "\nInvalid value, program will exit...\n"
	read -rp "  Press enter to exit"
	exit 1
fi

if ! grep -q 'Spotify Ad-Block Hosts' "/private/etc/hosts"; then
  clear
  printf "Spotyblock uninstalled or not detected. Current hosts : \n"
  cat "/private/etc/hosts"
  read -rp "  Press enter to exit"
  clear
else
  clear
  printf "Error modifying hosts file :c\n"
  read -rp "  Press enter to exit"
  clear
fi
