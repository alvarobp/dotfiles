which ack-grep &> /dev/null && alias ack='ack-grep'
alias ack='ack -Q'
alias be='bundle exec '
alias ber='bundle exec rspec'
alias ccd='cd $HOME/code'
alias curlo='curl -O'
alias eed='emacs'
alias gam='g amend'
alias gci='g ci'
alias gdc='g dc'
alias gdi='g di'
alias gfapu='g fapu'
alias gl='g l'
alias gla='g la'
alias gr='g rebase'
alias grc='g rebase --continue'
alias gri='g rebase -i'
alias gst='g st'
alias irb='irb --readline'
which bundle &> /dev/null && alias rake='bundle exec rake'
alias rdm='rake db:migrate'
alias rdmtp='rake db:migrate db:test:prepare'
alias rdrm='rake db:drop db:create db:migrate db:test:prepare'
alias rdtp='rake db:migrate'
alias rssh='rsync -avvurP -e ssh --delete '
alias vh='vagrant halt'
alias vu='vagrant up'
alias vun='vagrant up --no-provision'
alias vp='vagrant provision'
alias vs='vagrant ssh'
alias vst='vagrant status'
alias wgetn='wget --no-check-certificate '

# OSX specific
if uname -a | downcase | grep -q 'darwin'; then
  alias zcat='gunzip -c'

  if [ -d /Applications/Emacs.app ]; then
    alias eed='open -a /Applications/Emacs.app "$@"'
    alias need='open -a /Applications/Emacs.app -n '
  fi
fi

# Machine specific aliases
[[ -s $HOME/.aliases ]] && source $HOME/.aliases
