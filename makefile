#!/bin/bash
TODAY := $(shell date +'%Y-%m-%d')

help: ## Show this help message
	@echo "usage: make [target]"
	@echo
	@echo "targets:"
	@egrep "^(.+)\:\ ##\ (.+)" ${MAKEFILE_LIST} | column -t -c 2 -s ":#"

gitpush: ## git push m=any message
	clear;
	git add .; git commit -m "$(m)"; git push;


ssh-be: ## go to php container
	winpty docker exec -it --user root cont-php-fpm-8.3 bash

CURRENT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
update-branch:  ## update main branches
	git fetch --all;

	git checkout main; git reset --hard origin/main;

	git checkout $(CURRENT_BRANCH);
	git branch -l;
