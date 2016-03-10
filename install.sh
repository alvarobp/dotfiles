dotfiles_path=$(cd "$(dirname "$0")"; pwd)
current_date=`date "+%Y%m%d%H%M%S"`

function check_and_link_directory() {
  local path=$1

  if [ -d ~/$path ] || [ -h ~/$path ]
  then
    echo "Found ~/$path Backing up to ~/$path.pre-$current_date";
    mv ~/$path ~/$path.pre-$current_date
  fi
  ln -s $dotfiles_path/$path ~/$path
  echo "Linked ~/$path"
}

function check_and_link_file() {
  local path=$1

  if [ -f ~/$path ] || [ -h ~/$path ]
  then
    echo "Found ~/$path Backing up to ~/$path.pre-$current_date";
    mv ~/$path ~/$path.pre-$current_date
  fi
  ln -s $dotfiles_path/$path ~/$path
  echo "Linked ~/$path"
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
check_and_link_file ".zshrc"
check_and_link_directory ".zsh"

# EMACS
check_and_link_file ".emacs"
check_and_link_directory ".emacs.d"

# EDITRC
check_and_link_file ".editrc"

# GIT
check_and_link_file ".gitconfig"
check_and_link_file ".githelpers"

# GEM
check_and_link_file ".gemrc"

# IRB
check_and_link_file ".irbrc"

# TMUX
check_and_link_file ".tmux.conf"

# VIM
check_and_link_file ".vimrc"
check_and_link_directory ".vim"
mkdir -p $HOME/.vim/tmp
if which git &> /dev/null; then
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
