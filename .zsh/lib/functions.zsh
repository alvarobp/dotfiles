downcase () {
  while read data; do
    echo $data | tr "[A-Z]" "[a-z]"
  done
}