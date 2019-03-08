EDITRC_PATH := $(HOME)/.editrc
EDITRC_LINK := $(shell readlink -f $(EDITRC_PATH))
TMUX_CONF_PATH := $(HOME)/.tmux.conf
TMUX_CONF_LINK := $(shell readlink -f $(TMUX_CONF_PATH))

.PHONY: test_config

test_config:
	@echo -n "Test config... "
	@make -s test_editrc
	@make -s test_tmux_conf
	@echo "OK"

test_editrc:
	$(call assert_exists,$(EDITRC_PATH))
	$(call assert,$(call seq,$(EDITRC_LINK),$(DOTFILES)/config/editrc),editrc should link to $(DOTFILES)/config/editrc instead of to $(EDITRC_LINK))

test_tmux_conf:
	$(call assert_exists,$(TMUX_CONF_PATH))
	$(call assert,$(call seq,$(TMUX_CONF_LINK),$(DOTFILES)/config/tmux.conf),tmux.conf should link to $(DOTFILES)/config/tmux.conf instead of to $(TMUX_CONF_LINK))
