# SpotifyAdBlocker-macOS

## DISCLAIMER : I can't maintain this project anymore as I don't have a Mac. PR will be reviewed and accepted.

---

Script based on [Ruvelro/Spotihosts](https://github.com/ruvelro/Spotihosts) which adds a few lines to hosts file to block Spotify ads.

## Install 

Run this at the Terminal : 
`sudo bash -c "$(curl -Ss https://raw.githubusercontent.com/amgxv/SpotifyAdBlocker-macOS/master/install.sh)"`

### Uninstall

Run this at the Terminal : 
`sudo bash -c "$(curl -Ss https://raw.githubusercontent.com/amgxv/SpotifyAdBlocker-macOS/master/uninstall.sh)"`

### Update 

Run this at the Terminal : 
`sudo bash -c "$(curl -Ss https://raw.githubusercontent.com/amgxv/SpotifyAdBlocker-macOS/master/update.sh)"`

### How can I assure that hosts are enabled or deleted?
* Open your Terminal
* Run ```cat /private/etc/hosts```
* If you can see the following [hosts](https://raw.githubusercontent.com/amgxv/SpotifyAdBlocker-macOS/master/hosts/hosts.txt) below ```#[Spotify Ad-Block Hosts]``` line you have the correct hosts configured.
* If you want to fully assure that hosts are completely removed from your system, check if there are hosts remaining from other Spotyblock versions
* You can edit this hosts file with your favorite text editor, you'll need admin privileges to edit this file
