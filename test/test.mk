ifndef DST_DIR
$(error DST_DIR is not set)
endif

ifndef DOTFILES
$(error DOTFILES is not set)
endif

-include gmsl

.PHONY: test

test:
	@make -s test_vim
	@make -s test_emacs
	@make -s test_shell
	@echo "FINISHED"
