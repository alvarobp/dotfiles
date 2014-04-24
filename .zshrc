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
plugins=(git vagrant)

source $ZSH/oh-my-zsh.sh

source $HOME/.zsh/lib/functions.zsh
for config_file in `ls $HOME/.zsh/lib/*.zsh | grep -v functions.zsh`; do source $config_file; done

CUSTOM_ZSH_THEME="alvarobp"
[[ -s $HOME/.zsh/themes/$CUSTOM_ZSH_THEME.zsh-theme ]] && source "$HOME/.zsh/themes/$CUSTOM_ZSH_THEME.zsh-theme"

export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH

export TERM=xterm-256color

## Editors
export EDITOR=vim
export BUNDLER_EDITOR=$EDITOR

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Custom extensions (outside dotfiles)
[[ -s $HOME/.zsh-custom ]] && source $HOME/.zsh-custom
