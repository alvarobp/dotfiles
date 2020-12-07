VIM := $(shell command -v vim 2>/dev/null)

ifdef VIM
INSTALLERS += vim
CLEANERS += clean_vim

VIM_SRC_DIR := $(DOTFILES)/vim
VIM_DST_DIR := $(DST_DIR)/.vim
VIM_TMP_DIR := $(VIM_DST_DIR)/tmp
VIMRC := $(DST_DIR)/.vimrc

.PHONY: vim clean_vim vim_install_bundle

vim: banner_install_vim $(VIMRC) $(VIM_DST_DIR) $(VIM_TMP_DIR) vim_install_bundle

$(VIMRC):
	$(LINK) $(VIM_SRC_DIR)/vimrc $@

$(VIM_DST_DIR):
	$(LINK) $(VIM_SRC_DIR)/vim $@

$(VIM_TMP_DIR):
	$(MKDIR) $@

vim_install_bundle:
	vim +PlugInstall +PlugUpdate +qall

clean_vim: banner_clean_vim
	$(RM) $(VIM_DST_DIR)
	$(RM) $(VIMRC)

endif
