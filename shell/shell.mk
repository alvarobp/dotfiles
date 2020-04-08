OS := $(shell uname)

INSTALLERS += shell
CLEANERS += clean_shell

SHELL_SRC_DIR := $(DOTFILES)/shell
SHELL_DST_DIR := $(DST_DIR)/.shell
BASH_SRC_DIR := $(SHELL_SRC_DIR)/bash
BASH_DIR := $(DST_DIR)/.bash
BASH_PROFILE := $(DST_DIR)/.bash_profile
BASHRC := $(DST_DIR)/.bashrc
BASH_COMPLETION := $(DST_DIR)/.bash_completion
ZSH_SRC_DIR := $(SHELL_SRC_DIR)/zsh
ZSH_DIR := $(DST_DIR)/.zsh
ZSHRC := $(DST_DIR)/.zshrc

.PHONY: shell clean_shell bash_osx

shell: banner_install_shell $(SHELL_DST_DIR) $(BASH_DIR) $(BASHRC) $(BASH_COMPLETION) bash_osx $(ZSH_DIR) $(ZSHRC)

$(SHELL_DST_DIR):
	$(LINK) $(SHELL_SRC_DIR) $@

$(BASH_DIR):
	$(LINK) $(BASH_SRC_DIR)/bash $@

$(BASHRC):
	$(LINK) $(BASH_SRC_DIR)/bashrc $@

$(BASH_COMPLETION):
	$(LINK) $(BASH_SRC_DIR)/bash_completion $@

bash_osx:
	if [ "$(OS)" = "Darwin" ]; then\
		$(LINK) $(BASH_SRC_DIR)/bash_profile $(BASH_PROFILE);\
	fi

$(ZSH_DIR):
	$(LINK) $(ZSH_SRC_DIR)/zsh $@

$(ZSHRC):
	$(LINK) $(ZSH_SRC_DIR)/zshrc $@

clean_shell: banner_clean_shell
	$(RM) $(SHELL_DST_DIR)
	$(RM) $(BASH_DIR)
	$(RM) $(BASHRC)
	$(RM) $(BASH_PROFILE)
	$(RM) $(ZSH_DIR)
	$(RM) $(ZSHRC)
