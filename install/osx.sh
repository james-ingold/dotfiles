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
