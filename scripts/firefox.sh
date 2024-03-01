#!/bin/bash

sudo rm /usr/lib/firefox/config.js
sudo rm /usr/lib/firefox/defaults/pref/config-pref.js
sudo cp dots/firefox/install/config.js /usr/lib/firefox/config.js
sudo cp dots/firefox/install/defaults/pref/config-pref.js /usr/lib/firefox/defaults/pref/config-pref.js

DOTFILES_PATH="$(dirname "$(readlink -f "$0")")/.."

for file_path in $HOME/.mozilla/firefox/*.default; do
	rm -rf "$file_path/chrome"
	ln -s "$DOTFILES_PATH/dots/output/firefox/chrome" "$file_path/chrome"
	rm -rf "$file_path/user.js"
	ln -s "$DOTFILES_PATH/dots/output/firefox/user.js" "$file_path/user.js"
done
