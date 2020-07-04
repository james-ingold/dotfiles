#!/usr/bin/env bash
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "Not running linux"
    exit 1
fi

# get basic things for distros that don't ship with it
sudo apt-get install software-properties-common build-essential curl file git

# initialize variables

# Ubuntu distro release name, eg. "xenial"
release_name=$(lsb_release -c | awk '{print $2}')
apt_packages=()

# keepassx
apt_packages+=(keepassx)

# alacriitty
sudo add-apt-repository ppa:mmstick76/alacritty
apt_packages+=(alacritty)

# albertt
sudo add-apt-repository ppa:nilarimogard/webupd8
apt_packages+=(albert)

#dropbox
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu $release_name main"
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912Esudo
apt_packages+=(nautilus-dropbox)

#docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt_packages+=(docker-ce)
apt_packages+=(docker-ce-cli)
apt_packages+=(containerd.io)

#VSCodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
sudo apt-add-repository 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main'
apt_packages+=(codium)

#Brave Browser
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
apt_packages+=(brave-browser)

# Update apt
sudo apt-get -qq update

# install packages
installed_apt_packages="$(dpkg --get-selections | grep -v deinstall | awk 'BEGIN{FS="[\t:]"}{print $1}' | uniq)"
apt_packages=($(setdiff "${apt_packages[*]}" "$installed_apt_packages"))

if (( ${#apt_packages[@]} > 0 )); then
  for package in "${apt_packages[@]}"; do
    sudo apt-get -qq install "$package"
  done
fi
