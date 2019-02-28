dotfiles_path=$(cd "$(dirname "$0")"; pwd)
current_date=`date "+%Y%m%d%H%M%S"`

in_osx() {
  [[ "$(uname)" == "Darwin" ]]
}

check_and_link_directory() {
  local source_path=$1
  local destination_path=$2

  if [ -d ~/$destination_path ] || [ -h ~/$destination_path ]
  then
    echo "Found ~/$destination_path Backing up to ~/$destination_path.pre-$current_date";
    mv ~/$destination_path ~/$destination_path.pre-$current_date
  fi
  ln -s $dotfiles_path/$source_path ~/$destination_path
  echo "Linked ~/$destination_path"
}

check_and_link_file() {
  local source_path=$1
  local destination_path=$2

  if [ -f ~/$destination_path ] || [ -h ~/$destination_path ]
  then
    echo "Found ~/$destination_path Backing up to ~/$destination_path.pre-$current_date";
    mv ~/$destination_path ~/$destination_path.pre-$current_date
  fi
  ln -s $dotfiles_path/$source_path ~/$destination_path
  echo "Linked ~/$destination_path"
}

# EDITRC
check_and_link_file "config/editrc" ".editrc"

# Ruby
check_and_link_file "ruby/gemrc" ".gemrc"
check_and_link_file "ruby/irbrc" ".irbrc"

# TMUX
check_and_link_file "config/tmux.conf" ".tmux.conf"

# Binaries
mkdir -p $HOME/bin
binaryfiles=`ls $dotfiles_path/bin/`
for binfile in $binaryfiles; do
  check_and_link_file "bin/$binfile" "bin/$binfile"
done
