function downcase {
  while read data; do
    echo $data | tr "[A-Z]" "[a-z]"
  done
}

unalias gc
function gc {
  git commit -m "$*"
}

function gcn {
  git commit -n -m "$*"
}
