#!/usr/bin/env bash

hosts="#[Spotify Ad-Block Hosts]
0.0.0.0 adeventtracker.spotify.com
0.0.0.0 ads-fa.spotify.com
0.0.0.0 analytics.spotify.com
0.0.0.0 audio2.spotify.com
0.0.0.0 b.scorecardresearch.com
0.0.0.0 bounceexchange.com
0.0.0.0 bs.serving-sys.com
0.0.0.0 content.bitsontherun.com
0.0.0.0 core.insightexpressai.com
0.0.0.0 crashdump.spotify.com
0.0.0.0 desktop.spotify.com
0.0.0.0 ds.serving-sys.com
0.0.0.0 gtssl2-ocsp.geotrust.com
0.0.0.0 log.spotify.com
0.0.0.0 media-match.com
0.0.0.0 omaze.com
0.0.0.0 redirector.gvt1.com
0.0.0.0 s0.2mdn.net
0.0.0.0 v.jwpcdn.com
0.0.0.0 weblb-wg.gslb.spotify.com
0.0.0.0 www.omaze.com"

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
  
  echo -e "$hosts" >> "/private/etc/hosts"
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
