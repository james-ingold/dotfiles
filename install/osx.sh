#!/usr/bin/env bash

echo -e "\\n\\nSetting OS X settings"
echo "=============================="

# echo "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# echo "show hidden files by default"
defaults write com.apple.Finder AppleShowAllFiles -bool false

# echo "show the ~/Library folder in Finder"
chflags nohidden ~/Library

echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo " Empty Trash securely by default"
defaults write com.apple.finder EmptyTrashSecurely -bool true

echo " Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo " Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo " Turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300

echo " Never go into computer sleep mode"
systemsetup -setcomputersleep Off > /dev/null

echo " Increase sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo "Done with MacOS Settings"
