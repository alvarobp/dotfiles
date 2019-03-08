INSTALLERS += config
CLEANERS += clean_config

CONFIG_SRC_DIR := $(DOTFILES)/config
EDITRC := $(DST_DIR)/.editrc
TMUX_CONF := $(DST_DIR)/.tmux.conf

.PHONY: config clean_config

config: banner_install_config $(EDITRC) $(TMUX_CONF)

$(EDITRC):
	$(LINK) $(CONFIG_SRC_DIR)/editrc $@

$(TMUX_CONF):
	$(LINK) $(CONFIG_SRC_DIR)/tmux.conf $@

clean_config: banner_clean_config
	$(RM) $(EDITRC)
	$(RM) $(TMUX_CONF)
