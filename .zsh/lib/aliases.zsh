[[ -s $HOME/.aliases ]] && source $HOME/.aliases

alias rssh='rsync -avvurP -e ssh --delete '
alias wget='wget --no-check-certificate '
alias be='bundle exec '
alias ber='bundle exec rspec'

if [ -d /Applications/Emacs.app ]; then
  alias eed='open -a /Applications/Emacs.app "$@"'
  alias need='open -a /Applications/Emacs.app -n '
else
  # Fallback
  alias eed='emacs'
  alias need='eed'
fi