NEOVIM := $(shell command -v nvim 2>/dev/null)

ifdef NEOVIM
INSTALLERS += neovim
CLEANERS += clean_neovim

CONFIG_DIR := $(HOME)/.config
NEOVIM_SRC_DIR := $(DOTFILES)/neovim/nvim
NEOVIM_DST_DIR := $(CONFIG_DIR)/nvim

.PHONY: neovim clean_neovim

neovim: banner_install_neovim $(NEOVIM_DST_DIR)

ensure_config_dir:
	$(MKDIR) $(CONFIG_DIR)

$(NEOVIM_DST_DIR): ensure_config_dir
	$(LINK) $(NEOVIM_SRC_DIR) $@

clean_neovim: banner_clean_neovim
	$(RM) $(NEOVIM_DST_DIR)

endif
