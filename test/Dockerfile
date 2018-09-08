FROM ubuntu:latest

ENV DOTFILES_DIR /opt/dotfiles
ENV GIT_REPO https://github.com/alvarobp/dotfiles.git

RUN apt-get update && \
    apt-get install -y git-core
RUN git clone $GIT_REPO $DOTFILES_DIR

WORKDIR $DOTFILES_DIR

RUN bash $DOTFILES_DIR/install.sh
