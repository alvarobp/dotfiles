EMACS_PATH := $(HOME)/.emacs
EMACS_DIR_PATH := $(HOME)/.emacs.d
EMACS_LINK := $(shell readlink -f $(EMACS_PATH))
EMACS_DIR_LINK := $(shell readlink -f $(EMACS_DIR_PATH))

.PHONY: test_emacs

test_emacs:
	@echo -n "Test emacs... "
	@make -s test_emacs_config
	@make -s test_emacs_dir
	@echo "OK"

test_emacs_config:
	$(call assert_exists,$(EMACS_PATH))
	$(call assert,$(call seq,$(EMACS_LINK),$(DOTFILES)/emacs/emacs),.emacs should link to $(DOTFILES)/emacs/emacs instead of $(EMACS_LINK))

test_emacs_dir:
	$(call assert_exists,$(EMACS_DIR_PATH))
	$(call assert,$(call seq,$(EMACS_DIR_LINK),$(DOTFILES)/emacs/emacs.d),emacs directory should link to $(DOTFILES)/emacs/emacs.d instead of $(EMACS_DIR_LINK))
