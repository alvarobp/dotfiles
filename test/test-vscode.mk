VSCODE_SETTINGS_PATH := $(HOME)/.config/Code/User/settings.json
VSCODE_SETTINGS_LINK := $(shell readlink -f $(VSCODE_SETTINGS_PATH))
VSCODE_SETTINGS_DOTFILES_PATH := $(DOTFILES)/vscode/User/settings.json


.PHONY: test_vscode

test_vscode:
	@echo -n "Test vscode... "
	@make -s test_vscode_settings
	@echo "OK"

test_vscode_settings:
	$(call assert_exists,$(VSCODE_SETTINGS_PATH))
	$(call assert,$(call seq,$(VSCODE_SETTINGS_LINK),$(VSCODE_SETTINGS_DOTFILES_PATH)),vscode settings.json should link to $(VSCODE_SETTINGS_DOTFILES_PATH) instead of $(VSCODE_SETTINGS_LINK))