#!/usr/bin/env bash
xcode-select --install

echo "Go and install Xcode Command Line Tools."
echo "Press any key to continue"
read cont

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

if ! command -v brew >/dev/null 2>&1; then
  echo "You need to install Homebrew first. (http://brew.sh)"
  exit 1
fi

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew tap phinze/homebrew-cask
brew install brew-cask

brew cask alfred link

brew cask install google-chrome
brew cask install alfred
brew cask install appcleaner
brew cask install iterm2
brew cask install textmate
brew cask install the-unarchiver
brew cask install dropbox
brew cask install vlc
brew cask install transmission
brew cask install truecrypt
brew cask install virtualbox
brew cask install vagrant
brew cask install spotify
