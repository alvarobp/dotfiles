GEMRC_PATH := $(HOME)/.gemrc
GEMRC_LINK := $(shell readlink -f $(GEMRC_PATH))
IRBRC_PATH := $(HOME)/.irbrc
IRBRC_LINK := $(shell readlink -f $(IRBRC_PATH))

.PHONY: test_ruby

test_ruby:
	@echo -n "Test ruby... "
	@make -s test_gemrc
	@make -s test_irbrc
	@echo "OK"

test_gemrc:
	$(call assert_exists,$(GEMRC_PATH))
	$(call assert,$(call seq,$(GEMRC_LINK),$(DOTFILES)/ruby/gemrc),gemrc should link to $(DOTFILES)/ruby/gemrc instead of to $(GEMRC_LINK))

test_irbrc:
	$(call assert_exists,$(IRBRC_PATH))
	$(call assert,$(call seq,$(IRBRC_LINK),$(DOTFILES)/ruby/irbrc),irbrc should link to $(DOTFILES)/ruby/irbrc instead of to $(IRBRC_LINK))