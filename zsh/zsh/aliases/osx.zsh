# OSX specific aliases
if [[ "$(uname)" == "Darwin" ]]; then
  alias zcat='gunzip -c'

  if [ -d /Applications/Emacs.app ]; then
    alias eed='open -a /Applications/Emacs.app "$@"'
    alias need='open -a /Applications/Emacs.app -n '
  fi
fi
