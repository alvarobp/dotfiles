# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if in_osx && which brew &> /dev/null; then
  path="$(brew --prefix)/etc/bash_completion"
  [[ -f $path ]] && source $path
fi
