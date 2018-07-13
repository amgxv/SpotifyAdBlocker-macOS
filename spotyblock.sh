#!/bin/bash

FRIENDHOST=" [Spotify Ad-Block Hosts]
0.0.0.0 v.jwpcdn.com
0.0.0.0 weblb-wg.gslb.spotify.com
0.0.0.0 www.omaze.com
0.0.0.0 s0.2mdn.net
0.0.0.0 redirector.gvt1.com
0.0.0.0 omaze.com
0.0.0.0 media-match.com
0.0.0.0 log.spotify.com
0.0.0.0 gtssl2-ocsp.geotrust.com
0.0.0.0 ds.serving-sys.com
0.0.0.0 desktop.spotify.com
0.0.0.0 crashdump.spotify.com
0.0.0.0 core.insightexpressai.com
0.0.0.0 content.bitsontherun.com
0.0.0.0 bs.serving-sys.com
0.0.0.0 bounceexchange.com
0.0.0.0 b.scorecardresearch.com
0.0.0.0 audio2.spotify.com
0.0.0.0 adeventtracker.spotify.com
0.0.0.0 ads-fa.spotify.com
0.0.0.0 analytics.spotify.com"


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

printf "\nDo you want to see your friends' live Feed? [y|n]\n"
printf "With this option, in-app ads won't be removed...\n"
read FRIENDS

if [[ $FRIENDS = Y ]] || [[ $FRIENDS = y ]]; then
    WRITE=$FRIENDHOST
fi
if [[ $FRIENDS = N ]] || [[ $FRIENDS = n ]]; then
    WRITE=$HOSTS
fi
clear

if grep -q "Spotify Ad-Block Hosts" /private/etc/hosts;
then
	printf "You have already runned this script\n"
    read -p "  Press enter to exit"
	clear && exit
fi

echo -e "$WRITE" >> /private/etc/hosts
elif [[ $CONF = N ]] || [[ $CONF = n ]]; then
clear && exit
else
	printf "\nInvalid value, program will exit...\n"
	read -p "  Press enter to exit"
	exit
fi

if grep -q 'Spotify Ad-Block Hosts' /private/etc/hosts
then
clear
printf "Hosts file modified successfully!
Enjoy Spotify without Ads\n"
read -p "  Press enter to exit"
clear
else
clear
printf "Error modifying hosts file :c\n"
read -p "  Press enter to exit"
clear
fi

