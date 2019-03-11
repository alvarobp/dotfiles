INSTALLERS += bin
CLEANERS += clean_bin

BIN_SRC_DIR := $(DOTFILES)/bin
BIN_DST_DIR := $(DST_DIR)/bin

BINARIES := $(shell find $(BIN_SRC_DIR) \! -name '*.mk' -type f)
BINARIES_DST := $(foreach bin,$(BINARIES),$(BIN_DST_DIR)/$(notdir $(bin)))

.PHONY: bin clean_bin $(BINARIES)

bin: banner_install_bin $(BIN_DST_DIR) $(BINARIES)

$(BIN_DST_DIR):
	mkdir -p $@

$(BINARIES):
	$(LINK) $@ $(BIN_DST_DIR)/$(notdir $@)

clean_bin: banner_clean_bin
	$(RM) $(BINARIES_DST)
