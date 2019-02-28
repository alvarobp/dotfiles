GIT := $(shell command -v git 2>/dev/null)

ifdef GIT
INSTALLERS += git
CLEANERS += clean_git

GIT_SRC_DIR := $(DOTFILES)/git
GITCONFIG := $(DST_DIR)/.gitconfig
GITHELPERS := $(DST_DIR)/.githelpers

.PHONY: git clean_git

git: banner_install_git $(GITCONFIG) $(GITHELPERS)

$(GITCONFIG):
	$(LINK) $(GIT_SRC_DIR)/gitconfig $@

$(GITHELPERS):
	$(LINK) $(GIT_SRC_DIR)/githelpers $@

clean_git: banner_clean_git
	$(RM) $(GITCONFIG)
	$(RM) $(GITHELPERS)

endif
