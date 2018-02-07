#!/bin/bash

HOSTS="#[Spotify Ad-Block Hosts] 
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
0.0.0.0 spclient.wg.spotify.com
0.0.0.0 v.jwpcdn.com
0.0.0.0 weblb-wg.gslb.spotify.com
0.0.0.0 www.omaze.com"

if [ "$EUID" -ne 0 ]
  then 
  printf "\n"
  read -p "Please run as root"
  clear && exit
fi

clear
printf "\nThis script will edit your hosts file... \n"
printf "\nDo you want to continue? [y|n] \n"
read CONF

if [[ $CONF = Y ]] || [[ $CONF = y ]]; then
clear

if grep -q "Spotify Ad-Block Hosts" /private/etc/hosts;
then
	read -p "You have already runned this script"
	clear && exit
fi

echo -e "$HOSTS" >> /private/etc/hosts
elif [[ $CONF = N ]] || [[ $CONF = n ]]; then
clear && exit
else
	printf "\n"
	read -p "Invalid value, program will exit..."
	exit
fi

if grep -q 'Spotify Ad-Block Hosts' /private/etc/hosts
then
clear
read -p "Hosts file modified successfully!
Enjoy Spotify without Ads
"
clear
else
clear
read -p "Error modifying hosts file :c"
clear
fi

