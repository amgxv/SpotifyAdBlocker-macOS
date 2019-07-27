#!/bin/bash

if [ "$EUID" -ne 0 ]
  then 
  printf "\nThis script needs to be run as root.\nPassword will be asked...\n"
  sudo "$0"
  exit
fi

clear
printf "\nThis script will edit your hosts file... \n"
printf "\nDo you want to continue? [y|n] \n"
read CONF

if [[ $CONF = Y ]] || [[ $CONF = y ]]; then
clear

if grep -q "Spotify Ad-Block Hosts" /private/etc/hosts;
then
  sed -i -e "/#\[Spotify Ad-Block Hosts\]/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 adeventtracker.spotify.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 ads-fa.spotify.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 analytics.spotify.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 audio2.spotify.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 b.scorecardresearch.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 bounceexchange.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 bs.serving-sys.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 content.bitsontherun.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 core.insightexpressai.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 crashdump.spotify.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 desktop.spotify.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 ds.serving-sys.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 gtssl2-ocsp.geotrust.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 log.spotify.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 media-match.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 omaze.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 redirector.gvt1.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 s0.2mdn.net/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 spclient.wg.spotify.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 v.jwpcdn.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 weblb-wg.gslb.spotify.com/d" /private/etc/hosts
  sed -i -e "/0.0.0.0 www.omaze.com/d" /private/etc/hosts
fi
elif [[ $CONF = N ]] || [[ $CONF = n ]]; then
clear && exit
else
	printf "\nInvalid value, program will exit...\n"
	read -p "  Press enter to exit"
	exit
fi

grep -q 'Spotify Ad-Block Hosts' /private/etc/hosts
if [ $? -eq 1 ]
then
clear
printf "Spotyblock uninstalled or not detected. Current hosts : \n"
cat /private/etc/hosts
read -p "  Press enter to exit"
clear
else
clear
printf "Error modifying hosts file :c\n"
read -p "  Press enter to exit"
clear
fi