#!/bin/bash

## Usage: bash install-osx.sh

# REMEMBER to install the package-sync package and run "package-sync:sync" command

if [[ "$(uname)" == "Darwin" ]] && ! which -s realpath; then
  echo 'Error: realpath is missing. Please install coreutils with homebrew.'
  exit 1
fi

CONFIG_DIR="$HOME/.atom"

[ ! -d $CONFIG_DIR ] && mkdir -p $CONFIG_DIR

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for file in $(find . -name '*.cson'); do
  source_path=$(realpath $file)
  destination_path="$CONFIG_DIR/$file"

  ln -s "$source_path" "$destination_path"
done
IFS=$SAVEIFS

