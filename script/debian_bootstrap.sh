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

echo "source /etc/profile" >> /etc/zsh/zprofile

# Install vim

if debian_squeeze; then
  apt-get install vim -t squeeze-backports
else
  apt-get install -y vim
fi

# Install tmux from source

export TMUX_VERSION="2.0"
if debian_squeeze; then
  apt-get install -y libevent-dev -t squeeze-backports
else
  apt-get install -y libevent-dev
fi
apt-get install -y libncurses5-dev
cd /usr/src
wget http://heanet.dl.sourceforge.net/project/tmux/tmux/tmux-${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
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
