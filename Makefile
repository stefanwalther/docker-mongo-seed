help:										## Show this help.
	@echo ''
	@echo 'Available commands:'
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ''
.PHONY: help

gen-readme:							## Generate README.md (using docker-verb)
	docker run --rm -v ${PWD}:/opt/verb stefanwalther/verb
.PHONY: gen-readme

build:									## Build the docker image
	docker build -t stefanwalther/mongo-seed .
.PHONY: build

up-i:										## Bring up the environment (interactive mode).
	docker-compose up
.PHONY: up-i

up:											## Bring up the environment (daemon mode).
	docker-compose up -d
.PHONY: up

down:										## Tear down the environment.
	docker-compose down -t 0
.PHONY: down
