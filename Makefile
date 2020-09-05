.PHONY: all
all: dotfiles

.PHONY: dotfiles
dotfiles: 
	# add aliases for dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \

.PHONY: test
test: shellcheck # runs shellcheck on everything

.PHONY: shellcheck
shellcheck:
	./test.sh
