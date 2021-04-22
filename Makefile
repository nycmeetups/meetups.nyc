REVISION=$(shell bash -c 'r=`git rev-parse HEAD` && echo "$${r: -6}"')

.PHONY: build
build:
	docker build -t meetups.nyc/server:$(REVISION) -t meetups.nyc/server:latest .
