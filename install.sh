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
    printf "You have already ran this script\n"
    read -rp "  Press enter to exit"
    clear
    exit 0
  fi
  
  echo -e "#[Spotify Ad-Block Hosts]" >> "/private/etc/hosts"
  curl -Ss https://raw.githubusercontent.com/amgxv/SpotifyAdBlocker-macOS/master/hosts/hosts.txt -o /tmp/spotyblockhosts
  while read -r line
  do
    echo -e $line >> "/private/etc/hosts"
  done < "/tmp/spotyblockhosts"

  rm /tmp/spotyblockhosts
  killall mDNSResponder
  killall mDNSResponderHelper
elif [[ $conf = N ]] || [[ $conf = n ]]; then
  clear
  exit 0
else
	printf "\nInvalid value, program will exit...\n"
	read -rp "  Press enter to exit"
	exit 1
fi

if grep -q "Spotify Ad-Block Hosts" "/private/etc/hosts"; then
  clear
  printf "Hosts file modified successfully!
  Enjoy Spotify without Ads\n"
  read -rp "  Press enter to exit"
  clear
else
  clear
  printf "Error modifying hosts file :c\n"
  read -rp "  Press enter to exit"
  clear
fi
