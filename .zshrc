# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="alvarobp"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

for config_file (~/.zsh/lib/*.zsh) source $config_file

CUSTOM_ZSH_THEME="alvarobp"
[[ -s $HOME/.zsh/themes/$CUSTOM_ZSH_THEME.zsh-theme ]] && source "$HOME/.zsh/themes/$CUSTOM_ZSH_THEME.zsh-theme"

export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH

export TERM=xterm-256color

## Editors
export EDITOR=emacs
export BUNDLER_EDITOR=mate

# RVM
[[ -d $HOME/.rvm/bin ]] && export PATH=$HOME/.rvm/bin:$PATH
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Custom extensions (outside dotfiles)
[[ -s $HOME/.zsh-custom ]] && source $HOME/.zsh-custom