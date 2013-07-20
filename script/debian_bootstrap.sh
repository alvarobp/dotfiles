#!/bin/bash

COMMON_USER="vagrant"

sudo su

# Install zsh

apt-get install zsh

# dotfiles

su $COMMON_USER -c "
cd /home/$COMMON_USER
git clone https://github.com/alvarobp/dotfiles.git .dotfiles
bash .dotfiles/install.sh
"

# Make zsh load profile.d scripts

echo "source /etc/profile" >> /etc/zsh/zprofile

# Install emacs snapshot

wget -q -O - http://emacs.naquadah.org/key.gpg | apt-key add -
echo 'deb http://emacs.naquadah.org/ stable/' > /etc/apt/sources.list.d/emacs-snapshot.list
apt-get update
apt-get install emacs-snapshot-nox

# Install tmux from source

export TMUX_VERSION="1.8"
apt-get install -y libncurses5-dev libevent-dev
cd /usr/src
wget http://heanet.dl.sourceforge.net/project/tmux/tmux/tmux-${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
tar xvfz tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
./configure --prefix=/usr/local
make install

# Make rbenv writable by common user

chgrp -R $COMMON_USER /usr/local/rbenv
chmod -R g+rwxXs /usr/local/rbenv
