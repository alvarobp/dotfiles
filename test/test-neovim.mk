NEOVIM_DIR_PATH := $(HOME)/.config/nvim
NEOVIM_DIR_LINK := $(shell readlink -f $(NEOVIM_DIR_PATH))

.PHONY: test_neovim

test_neovim:
	@echo -n "Test neovim... "
	@make -s test_neovim_dir
	@echo "OK"

test_neovim_dir:
	$(call assert_exists,$(NEOVIM_DIR_PATH))
	$(call assert,$(call seq,$(NEOVIM_DIR_LINK),$(DOTFILES)/neovim/nvim),neovim directory should link to $(DOTFILES)/neovim/nvim instead of $(NEOVIM_DIR_LINK))
