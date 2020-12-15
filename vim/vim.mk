VIM := $(shell command -v vim 2>/dev/null)

ifdef VIM
INSTALLERS += vim
CLEANERS += clean_vim

VIM_SRC_DIR := $(DOTFILES)/vim
VIM_DST_DIR := $(DST_DIR)/.vim
VIM_TMP_DIR := $(VIM_DST_DIR)/tmp
VIM_AUTOLOAD := $(VIM_DST_DIR)/autoload
VIM_PLUG := $(VIM_AUTOLOAD)/plug.vim
VIMRC := $(DST_DIR)/.vimrc

.PHONY: vim clean_vim vim_install_plugins

vim: banner_install_vim $(VIMRC) $(VIM_DST_DIR) $(VIM_TMP_DIR) $(VIM_AUTOLOAD) $(VIM_PLUG) vim_install_plugins

$(VIMRC):
	$(LINK) $(VIM_SRC_DIR)/vimrc $@

$(VIM_DST_DIR):
	$(LINK) $(VIM_SRC_DIR)/vim $@

$(VIM_TMP_DIR):
	$(MKDIR) $@

$(VIM_AUTOLOAD):
	$(MKDIR) $@

$(VIM_PLUG):
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim_install_plugins:
	vim +PlugInstall +PlugUpdate +qall

clean_vim: banner_clean_vim
	$(RM) $(VIM_DST_DIR)
	$(RM) $(VIMRC)

endif
