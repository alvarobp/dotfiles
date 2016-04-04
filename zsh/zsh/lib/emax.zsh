function emax() {
  while getopts :t: opt
  do
   case $opt in
     't') local frame_title=$OPTARG ;;
   esac
  done
  shift $[ $OPTIND - 1 ]

  local command="open -a /Applications/Emacs.app -n" #~/code/peertransfer_baywatch --args --eval '(setq frame-title-format \"BAYWATCH: %b\")'"
  
  if [ $1 ]; then
    command="$command $1"
  else
    command="$command ."
  fi

  if [ $frame_title ]; then
    command="$command --args --eval '(setq frame-title-format \"$frame_title: %b\")'"
  fi

  eval $command
}