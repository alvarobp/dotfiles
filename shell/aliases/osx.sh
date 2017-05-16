# OSX specific aliases
if in_osx; then
  alias zcat='gunzip -c'

  if [ -d /Applications/Emacs.app ]; then
    alias eed='open -a /Applications/Emacs.app "$@"'
    alias need='open -a /Applications/Emacs.app -n '
  fi

  if which gtruncate &> /dev/null; then
    alias truncate='gtruncate'
  fi
fi
