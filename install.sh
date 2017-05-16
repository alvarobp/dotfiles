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

# Shell - Common
check_and_link_directory "shell" ".shell"

# Shell - Bash
check_and_link_file "shell/bash/bashrc" ".bashrc"
check_and_link_directory "shell/bash/bash" ".bash"
in_osx && check_and_link_file "shell/bash/bash_profile" ".bash_profile"

# Shell - Zsh
check_and_link_file "shell/zsh/zshrc" ".zshrc"
check_and_link_directory "shell/zsh/zsh" ".zsh"

# EMACS
check_and_link_file "emacs/emacs" ".emacs"
check_and_link_directory "emacs/emacs.d" ".emacs.d"

# EDITRC
check_and_link_file "config/editrc" ".editrc"

# GIT
check_and_link_file "git/gitconfig" ".gitconfig"
check_and_link_file "git/githelpers" ".githelpers"

# Ruby
check_and_link_file "ruby/gemrc" ".gemrc"
check_and_link_file "ruby/irbrc" ".irbrc"

# TMUX
check_and_link_file "config/tmux.conf" ".tmux.conf"

# VIM
check_and_link_file "vim/vimrc" ".vimrc"
check_and_link_directory "vim/vim" ".vim"
mkdir -p $HOME/.vim/tmp
if which vim && which git &> /dev/null; then
  echo "Installing vim plugins..."
  vim +NeoBundleInstall +qall
  echo "vim plugins installed"
else
  echo "Vim plugins were not installed. git is not available."
fi

# Binaries
mkdir -p $HOME/bin
binaryfiles=`ls $dotfiles_path/bin/`
for binfile in $binaryfiles; do
  check_and_link_file "bin/$binfile" "bin/$binfile"
done
