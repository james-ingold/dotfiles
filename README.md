## dotfiles

Cross-Platform (macOS and Linux) collection of configuration files

## Install

Installation
If on OSX, you will need to install the XCode CLI tools before continuing. To do so, open a terminal and type

`➜ xcode-select --install`

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
