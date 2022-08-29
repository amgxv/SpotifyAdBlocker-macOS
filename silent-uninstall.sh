#!/usr/bin/env bash

echo "Uninstalling Spotyblock..."
sudo sed -i -e "/#\[Spotify Ad-Block Hosts\]/d" "/private/etc/hosts"
while read -r line
do
  sudo sed -i -e "/$line/d" "/private/etc/hosts"
done < "hosts.txt"

sudo killall mDNSResponder
sudo killall mDNSResponderHelper
