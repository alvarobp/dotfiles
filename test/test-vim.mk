VIMRC_PATH := $(HOME)/.vimrc
VIM_DIR_PATH := $(HOME)/.vim
VIM_TMP_DIR_PATH := $(HOME)/.vim/tmp
VIMRC_LINK := $(shell readlink -f $(VIMRC_PATH))
VIM_DIR_LINK := $(shell readlink -f $(VIM_DIR_PATH))

.PHONY: test_vim

test_vim:
	@echo -n "Test vim... "
	@make -s test_vimrc
	@make -s test_vim_dir
	@make -s test_vim_tmp_dir
	@echo "OK"

test_vimrc:
	$(call assert_exists,$(VIMRC_PATH))
	$(call assert,$(call seq,$(VIMRC_LINK),$(DOTFILES)/vim/vimrc),vimrc should link to $(DOTFILES)/vim/vimrc instead of $(VIMRC_LINK))

test_vim_dir:
	$(call assert_exists,$(VIM_DIR_PATH))
	$(call assert,$(call seq,$(VIM_DIR_LINK),$(DOTFILES)/vim/vim),vim directory should link to $(DOTFILES)/vim/vim instead of $(VIM_DIR_LINK))

test_vim_tmp_dir:
	$(call assert_exists,$(VIM_TMP_DIR_PATH))
