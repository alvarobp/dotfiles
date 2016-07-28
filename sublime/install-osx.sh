#!/bin/bash

## Usage: bash install-osx.sh

if ! which -s realpath; then
  echo 'Error: realpath is missing. Please install coreutils with homebrew.'
  exit 1
fi

USER_PACKAGES="$HOME/Library/Application Support/Sublime Text 3/Packages/User"

mkdir -p "$USER_PACKAGES"

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for file in $(find . -name '*sublime-settings'); do
  source_path=$(realpath $file)
  destination_path="$USER_PACKAGES/$file"

  ln -s "$source_path" "$destination_path"
done
IFS=$SAVEIFS

