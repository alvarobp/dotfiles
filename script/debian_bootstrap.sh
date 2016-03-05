#!/bin/bash

function debian_squeeze () {
  grep -q '^6' /etc/debian_version
}

COMMON_USER="vagrant"

apt-get update

# Install zsh

apt-get install -y zsh

# dotfiles

sudo -u $COMMON_USER bash -c "
cd /home/$COMMON_USER
git clone https://github.com/alvarobp/dotfiles.git .dotfiles
bash .dotfiles/install.sh
"

# Make zsh load profile.d scripts

if ! grep -q 'source /etc/profile' /etc/zsh/zprofile; then
  echo "source /etc/profile" >> /etc/zsh/zprofile
fi

# Install vim

if debian_squeeze; then
  apt-get install vim -t squeeze-backports
else
  apt-get install -y vim
fi

# Install tmux from source

export TMUX_VERSION="2.1"
if debian_squeeze; then
  apt-get install -y libevent-dev -t squeeze-backports
else
  apt-get install -y libevent-dev
fi
apt-get install -y libncurses5-dev
cd /usr/src
wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
tar xvfz tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
./configure --prefix=/usr/local
make install

# Install ack

export ACK_VERSION="2.14"
sudo -u $COMMON_USER bash -c "
mkdir -p /home/$COMMON_USER/bin
curl http://beyondgrep.com/ack-${ACK_VERSION}-single-file > ~/bin/ack && chmod 0755 ~/bin/ack
"

# Install Git
sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev

export GIT_VERSION="2.7.2"
cd /usr/src
wget https://www.kernel.org/pub/software/scm/git/git-${GIT_VERSION}.tar.gz
tar xvfz git-${GIT_VERSION}.tar.gz
cd git-${GIT_VERSION}
make configure
./configure --prefix=/usr
make all doc info
sudo make install
