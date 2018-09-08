#!/usr/bin/env sh

docker build . -t dotfiles-test
docker run --rm -it dotfiles-test bash
