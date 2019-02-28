RUBY := $(shell command -v ruby 2>/dev/null)

ifdef RUBY
INSTALLERS += ruby
CLEANERS += clean_ruby

RUBY_SRC_DIR := $(DOTFILES)/ruby
GEMRC := $(DST_DIR)/.gemrc
IRBRC := $(DST_DIR)/.irbrc

.PHONY: git clean_ruby

ruby: banner_install_ruby $(GEMRC) $(IRBRC)

$(GEMRC):
	$(LINK) $(RUBY_SRC_DIR)/gemrc $@

$(IRBRC):
	$(LINK) $(RUBY_SRC_DIR)/irbrc $@

clean_ruby: banner_clean_ruby
	$(RM) $(GEMRC)
	$(RM) $(IRBRC)

endif
