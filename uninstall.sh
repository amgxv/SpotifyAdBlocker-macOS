#!/usr/bin/env bash

echo "Uninstalling Spotyblock..."
sudo sed -i -e "/#\[Spotify Ad-Block Hosts\]/d" "/private/etc/hosts"
curl -Ss https://raw.githubusercontent.com/amgxv/SpotifyAdBlocker-macOS/master/hosts/hosts.txt -o /tmp/spotyblockhosts
curl -Ss https://raw.githubusercontent.com/amgxv/SpotifyAdBlocker-macOS/master/hosts/old_hosts.txt -o /tmp/spotyblockoldhosts

while read -r line
do
  sudo sed -i -e "/$line/d" "/private/etc/hosts"
done < "/tmp/spotyblockhosts"

while read -r line
do
  sudo sed -i -e "/$line/d" "/private/etc/hosts"
done < "/tmp/spotyblockoldhosts"

rm /tmp/spotyblockhosts
rm /tmp/spotyblockoldhosts
sudo killall mDNSResponder
sudo killall mDNSResponderHelper
