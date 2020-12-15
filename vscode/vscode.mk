VSCODE := $(shell command -v code 2>/dev/null)

ifdef VSCODE
INSTALLERS += vscode
CLEANERS += clean_vscode

VSCODE_SRC_DIR := $(DOTFILES)/vscode
VSCODE_USER_SRC_DIR := $(VSCODE_SRC_DIR)/User
VSCODE_USER_DST_DIR := $(DST_DIR)/.config/Code/User
VSCODE_SETTINGS := $(VSCODE_USER_DST_DIR)/settings.json
VSCODE_EXTENSIONS_LIST := $(VSCODE_SRC_DIR)/extensions.list

.PHONY: vscode clean_vscode

vscode: banner_install_vscode $(VSCODE_USER_DST_DIR) $(VSCODE_SETTINGS) vscode_install_extensions

$(VSCODE_USER_DST_DIR):
	$(MKDIR) $@

$(VSCODE_SETTINGS):
	$(LINK) $(VSCODE_USER_SRC_DIR)/settings.json $@

vscode_install_extensions:
	@cat $(VSCODE_EXTENSIONS_LIST) | xargs -L 1 -i code --install-extension {} --force

save_vscode_extensions:
	@code --list-extensions > $(VSCODE_EXTENSIONS_LIST)

clean_vscode: banner_clean_vscode
	$(RM) $(VSCODE_SETTINGS)

endif
