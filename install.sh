dotfiles_path=$(cd "$(dirname "$0")"; pwd)
current_date=`date "+%Y%m%d%H%M%S"`

function check_and_link_directory() {
  local path=$1
  
  if [ -d ~/$path ] || [ -h ~/$path ]
  then
    echo "\033[0;33mFound ~/$path\033[0m \033[0;32 Backing up to ~/$path.pre-$current_date\033[0m";
    mv ~/$path ~/$path.pre-$current_date
  fi
  ln -s $dotfiles_path/$path ~/$path
  echo "\033[0;34mLinked ~/$path\033[0m"
}

function check_and_link_file() {
  local path=$1

  if [ -f ~/$path ] || [ -h ~/$path ]
  then
    echo "\033[0;33mFound ~/$path\033[0m \033[0;32 Backing up to ~/$path.pre-$current_date\033[0m";
    mv ~/$path ~/$path.pre-$current_date
  fi
  ln -s $dotfiles_path/$path ~/$path
  echo "\033[0;34mLinked ~/$path\033[0m"
}

function check_and_install_oh_my_zsh() {
  if [ ! -d ~/.oh-my-zsh ]
  then
    echo "\033[0;34mCloning Oh My Zsh...\033[0m"
    /usr/bin/env git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    
    echo "\033[0;34mSetting default shell to zsh\033[0m"
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

# GIT
check_and_link_file ".gitconfig"
check_and_link_file ".githelpers"

# GEM
check_and_link_file ".gemrc"

# IRB
check_and_link_file ".irbrc"

# TMUX
check_and_link_file ".tmux.conf"

# Binaries
mkdir -p $HOME/bin
binaryfiles=`ls $dotfiles_path/bin/`
for binfile in $binaryfiles; do
  check_and_link_file "bin/$binfile"
done

/usr/bin/env zsh
source ~/.zshrc