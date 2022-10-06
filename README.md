## dotfiles

Cross-Platform (macOS and Linux) collection of configuration files

## Install

Installation
If on OSX, you will need to install the XCode CLI tools before continuing. To do so, open a terminal and type

`➜ xcode-select --install`

Need to install homebrew and gpg before running the install in here
/bin/bash -c "\$(curl -fsSL
https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install gpg

## Creating a Collab git-crypt key

`gpg --gen-key`

`gpg --armor --export --output /Users/somewhere/user_pubkey.gpg {KeyID}`

Ship the file to a place that has authority to add and edit git-crypt.

`gpg --import user_pubkey.gpg`

edit the key and trust it

`git-crypt add-gpg-user {KeyID}`

`git-crypt unlock`

## Pre-Install

NVM

Minpac `git clone https://github.com/k-takata/minpac.git \ ~/.vim/pack/minpac/opt/minpack`

Then, clone the dotfiles repository to your home directory as ~/.dotfiles.

➜ git clone https://github.com/james-ingold/dotfiles.git ~/.dotfiles && cd
~/.dotfiles && ./install.sh

ln -sv \$PWD/karabiner.json ~/.config/karabiner/

ln -sv ~/Documents/Repositories/dotfiles/zsh/.zshrc ~/.zshrc

ln -sv ~/Documents/Repositories/dotfiles/default-packages \$NVM_DIR/

ln -sv ~/Documents/Repositories/dotfiles/.gitignore_global ~/

ln -sv \$PWD/.editorconfig ~

### Iterm2 Nova Colors

Navigate to Colors in Iterm2 and Import nova.itermcolors

### Fonts

https://github.com/powerline/fonts
