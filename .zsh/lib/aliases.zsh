alias rssh='rsync -avvurP -e ssh --delete '
alias wgetn='wget --no-check-certificate '
alias be='bundle exec '
alias ber='bundle exec rspec'

alias emacs='emacs -nw'

if [ -d /Applications/Emacs.app ]; then
  alias eed='open -a /Applications/Emacs.app "$@"'
  alias need='open -a /Applications/Emacs.app -n '
else
  # Fallback
  alias eed='emacs'
  alias need='eed'
fi

[[ -s $HOME/.aliases ]] && source $HOME/.aliases