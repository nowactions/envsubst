SHELL = bash

VERSION := $(shell grep -m1 version Dockerfile | awk -F= '{ print $$2 }' | sed 's/[\",]//g')

.PHONY: release
release:
	git tag -a $(VERSION) -m $(VERSION)
	git push --tags
