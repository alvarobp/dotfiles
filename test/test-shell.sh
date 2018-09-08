#!/usr/bin/env sh

docker build . -t dotfiles-test
docker run --rm -v "$(pwd)"/..:/opt/dotfiles -w /opt/dotfiles -it dotfiles-test bash -c 'make && bash'
