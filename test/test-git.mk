GITCONFIG_PATH := $(HOME)/.gitconfig
GITCONFIG_LINK := $(shell readlink -f $(GITCONFIG_PATH))
GITHELPERS_PATH := $(HOME)/.githelpers
GITHELPERS_LINK := $(shell readlink -f $(GITHELPERS_PATH))

.PHONY: test_git

test_git:
	@echo -n "Test git... "
	@make -s test_gitconfig
	@make -s test_githelpers
	@echo "OK"

test_gitconfig:
	$(call assert_exists,$(GITCONFIG_PATH))
	$(call assert,$(call seq,$(GITCONFIG_LINK),$(DOTFILES)/git/gitconfig),gitconfig should link to $(DOTFILES)/git/gitconfig instead of to $(GITCONFIG_LINK))

test_githelpers:
	$(call assert_exists,$(GITHELPERS_PATH))
	$(call assert,$(call seq,$(GITHELPERS_LINK),$(DOTFILES)/git/githelpers),githelpers should link to $(DOTFILES)/git/githelpers instead of to $(GITHELPERS_LINK))