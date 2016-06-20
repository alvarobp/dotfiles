#!/usr/bin/env bash
xcode-select --install

echo "Go and install Xcode Command Line Tools."
echo "Press any key to continue"
read cont

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if ! command -v brew >/dev/null 2>&1; then
  echo "You need to install Homebrew first. (http://brew.sh)"
  exit 1
fi

brew tap Homebrew/bundle

brew bundle --file=Brewfile
