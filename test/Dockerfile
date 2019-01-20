FROM ubuntu:latest

ENV VSCODE_EXECUTABLE_STUB /usr/local/bin/code

RUN apt-get update && \
    apt-get install -y build-essential git-core vim emacs-nox gmsl

RUN touch $VSCODE_EXECUTABLE_STUB && chmod +x $VSCODE_EXECUTABLE_STUB

RUN rm -fr $HOME/.bashrc

