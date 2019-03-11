BIN_SRC_DIR := $(DOTFILES)/bin
BIN_DST_DIR := $(HOME)/bin

BINARIES := $(shell find $(BIN_SRC_DIR) \! -name '*.mk' -type f)
BINARIES_DST := $(foreach bin,$(BINARIES),$(BIN_DST_DIR)/$(notdir $(bin)))

.PHONY: test_bin $(BINARIES_DST)

test_bin:
	@echo -n "Test bin... "
	@make -s $(BINARIES_DST)
	@echo "OK"

$(BINARIES_DST):
	$(call assert_exists,$@)
	$(call assert,$(call seq,$(shell readlink -f $@),$(DOTFILES)/bin/$(notdir $@)),$@ should link to $(DOTFILES)/bin/$(notdir $@) instead of to $(shell readlink -f $@))
