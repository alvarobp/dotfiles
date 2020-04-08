alias g='git'
alias ga='git add'
alias gam='git amend'
alias gci='git ci'
alias gco='git checkout'
alias gdc='git dc'
alias gdi='git di'
alias gfapu='git fapu'
alias gl='git l'
alias gla='git la'
alias gr='git rebase'
alias grc='git rebase --continue'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gri='git rebase -i'
alias gst='git st'

alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'

alias gignore='git update-index --assume-unchanged'
alias gunignore='git update-index --no-assume-unchanged'

complete -F _complete_alias gco

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
