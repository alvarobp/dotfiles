function rvm_with_gemset {
  local gemset=$(rvm-prompt g 2> /dev/null) || return
  [ "$gemset" != "" ] && echo "$gemset "
}