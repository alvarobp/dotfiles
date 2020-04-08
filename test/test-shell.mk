SHELL_DIR := $(HOME)/.shell
SHELL_DIR_LINK := $(shell readlink -f $(SHELL_DIR))
BASH_DIR := $(HOME)/.bash
BASH_DIR_LINK := $(shell readlink -f $(BASH_DIR))
BASHRC := $(HOME)/.bashrc
BASHRC_LINK := $(shell readlink -f $(BASHRC))
BASH_COMPLETION := $(HOME)/.bash_completion
BASH_COMPLETION_LINK := $(shell readlink -f $(BASH_COMPLETION))
BASH_PROFILE := $(HOME)/.bash_profile
BASH_PROFILE_LINK := $(shell readlink -f $(BASH_PROFILE))
ZSH_DIR := $(HOME)/.zsh
ZSH_DIR_LINK := $(shell readlink -f $(ZSH_DIR))
ZSHRC := $(HOME)/.zshrc
ZSHRC_LINK := $(shell readlink -f $(ZSHRC))

.PHONY: test_shell

test_shell:
	@echo -n "Test shell... "
	@make -s test_shell_dir
	@make -s test_bashrc
	@make -s test_bash_completion
	@make -s test_bash_dir
	@make -s test_bash_osx
	@make -s test_zshrc
	@make -s test_zsh_dir
	@echo "OK"

test_shell_dir:
	$(call assert_exists,$(SHELL_DIR))
	$(call assert,$(call seq,$(SHELL_DIR_LINK),$(DOTFILES)/shell),$(SHELL_DIR) should link to $(DOTFILES)/shell instead of $(SHELL_DIR_LINK))

test_bashrc:
	$(call assert_exists,$(BASHRC))
	$(call assert,$(call seq,$(BASHRC_LINK),$(DOTFILES)/shell/bash/bashrc),$(BASHRC) should link to $(DOTFILES)/shell/bash/bashrc instead of $(BASHRC_LINK))

test_bash_completion:
	$(call assert_exists,$(BASH_COMPLETION))
	$(call assert,$(call seq,$(BASH_COMPLETION_LINK),$(DOTFILES)/shell/bash/bash_completion),$(BASH_COMPLETION) should link to $(DOTFILES)/shell/bash/bash_completion instead of $(BASH_COMPLETION_LINK))

test_bash_dir:
	$(call assert_exists,$(BASH_DIR))
	$(call assert,$(call seq,$(BASH_DIR_LINK),$(DOTFILES)/shell/bash/bash),$(BASH_DIR) should link to $(DOTFILES)/shell/bash/bash instead of $(BASH_DIR_LINK))

test_bash_osx:
ifeq ($(shell uname),Darwin)
	$(call assert_exists,$(BASH_PROFILE))
	$(call assert,$(call seq,$(BASH_PROFILE_LINK),$(DOTFILES)/shell/bash/bash_profile),$(BASH_PROFILE) should link to $(DOTFILES)/shell/bash/bash_profile instead of $(BASH_PROFILE_LINK))
endif

test_zshrc:
	$(call assert_exists,$(ZSHRC))
	$(call assert,$(call seq,$(ZSHRC_LINK),$(DOTFILES)/shell/zsh/zshrc),$(ZSHRC) should link to $(DOTFILES)/shell/zsh/zshrc instead of $(ZSHRC_LINK))

test_zsh_dir:
	$(call assert_exists,$(ZSH_DIR))
	$(call assert,$(call seq,$(ZSH_DIR_LINK),$(DOTFILES)/shell/zsh/zsh),$(ZSH_DIR) should link to $(DOTFILES)/shell/zsh/zsh instead of $(ZSH_DIR_LINK))
