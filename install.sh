dotfiles_path=$(cd "$(dirname "$0")"; pwd)
current_date=`date "+%Y%m%d%H%M%S"`

function check_and_link_directory() {
  local source_path=$1
  local destination_path=$2

  if [[ -z $destination_path ]]; then
    local destination_path=$source_path
  fi

  if [ -d ~/$destination_path ] || [ -h ~/$destination_path ]
  then
    echo "Found ~/$destination_path Backing up to ~/$destination_path.pre-$current_date";
    mv ~/$destination_path ~/$destination_path.pre-$current_date
  fi
  ln -s $dotfiles_path/$source_path ~/$destination_path
  echo "Linked ~/$destination_path"
}

function check_and_link_file() {
  local source_path=$1
  local destination_path=$2

  if [[ -z $destination_path ]]; then
    local destination_path=$source_path
  fi

  if [ -f ~/$destination_path ] || [ -h ~/$destination_path ]
  then
    echo "Found ~/$destination_path Backing up to ~/$destination_path.pre-$current_date";
    mv ~/$destination_path ~/$destination_path.pre-$current_date
  fi
  ln -s $dotfiles_path/$source_path ~/$destination_path
  echo "Linked ~/$destination_path"
}

function check_and_install_oh_my_zsh() {
  if [ ! -d ~/.oh-my-zsh ]
  then
    echo "Cloning Oh My Zsh..."
    /usr/bin/env git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

    echo "Setting default shell to zsh. Please enter your password."
    chsh -s `which zsh`
  fi
}

# ZSH
check_and_install_oh_my_zsh
check_and_link_file "zsh/zshrc" ".zshrc"
check_and_link_directory "zsh/zsh" ".zsh"

# EMACS
check_and_link_file "emacs/emacs" ".emacs"
check_and_link_directory "emacs/emacs.d" ".emacs.d"

# EDITRC
check_and_link_file ".editrc"

# GIT
check_and_link_file "git/gitconfig" ".gitconfig"
check_and_link_file "git/githelpers" ".githelpers"

# Ruby
check_and_link_file "ruby/gemrc" ".gemrc"
check_and_link_file "ruby/irbrc" ".irbrc"

# TMUX
check_and_link_file ".tmux.conf"

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
  check_and_link_file "bin/$binfile"
done
