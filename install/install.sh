#!/usr/bin/env bash

echo "Installing dotfiles."

if [ "$(uname)" == "Darwin" ]; then
  source install/osx.sh
else
  source install/linux.sh
fi

source ./install/link.sh

# TODO: Install git config here

export HOMEBREW_NO_ANALYTICS=1
if test ! "$( command -v brew )"; then
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    if [ "$(uname)" == "Linux" ]
    then
        echo "adding brew to Linux path"
        echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> $HOME/.profile
        source $HOME/.profile
    fi
fi

echo -e "\\n\\nInstalling homebrew packages..."
echo "=============================="

brew bundle

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# After the install, setup fzf - key bindings and fuzzy completions
echo -e "\\n\\nRunning fzf install script..."
echo "=============================="
"$(brew --prefix)"/opt/fzf/install --all --no-bash --no-fish

# after the install, install neovim python libraries
echo -e "\\n\\nRunning Neovim Python install"
echo "=============================="
#pip2 install --user neovim
pip3 install --user neovim

# Change the default shell to zsh
zsh_path="$( command -v zsh )"
if ! grep "$zsh_path" /etc/shells; then
    echo "adding $zsh_path to /etc/shells"
    echo "$zsh_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
    chsh -s "$zsh_path"
    echo "default shell changed to $zsh_path"
fi

echo -e "\\n\\nInstalling NVM..."
echo "=============================="
NVM_RELEASE_VERSION=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | jq -r '.tag_name')
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/"$NVM_RELEASE_VERSION"/install.sh | bash

echo "Done Installing dotfiles. Reloading your terminal."

source $HOME/.zshrc
