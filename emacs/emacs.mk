EMACS := $(shell command -v emacs 2>/dev/null)

ifdef EMACS
INSTALLERS += emacs
CLEANERS += clean_emacs

EMACS_SRC_DIR := $(DOTFILES)/emacs
EMACS_DST_DIR := $(DST_DIR)/.emacs.d
EMACS_FILE := $(DST_DIR)/.emacs

.PHONY: emacs clean_emacs

emacs: banner_install_emacs $(EMACS_FILE) $(EMACS_DST_DIR)

$(EMACS_FILE):
	$(LINK) $(EMACS_SRC_DIR)/emacs $@

$(EMACS_DST_DIR):
	$(LINK) $(EMACS_SRC_DIR)/emacs.d $@

clean_emacs: banner_clean_emacs
	$(RM) $(EMACS_DST_DIR)
	$(RM) $(EMACS_FILE)

endif
