alias g='git'
alias ga='git add'
alias gam='g amend'
alias gci='g ci'
alias gdc='g dc'
alias gdi='g di'
alias gfapu='g fapu'
alias gl='g l'
alias gla='g la'
alias gr='g rebase'
alias grc='g rebase --continue'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gri='g rebase -i'
alias gst='g st'

alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'

alias gignore='git update-index --assume-unchanged'
alias gunignore='git update-index --no-assume-unchanged'

function git_current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function gc {
  git commit -m "$*"
}

function gcn {
  git commit -n -m "$*"
}
