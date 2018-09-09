FROM ubuntu:latest

ENV DOTFILES_DIR /opt/dotfiles

RUN apt-get update && \
    apt-get install -y build-essential git-core vim emacs-nox gmsl

RUN rm -fr $HOME/.bashrc

