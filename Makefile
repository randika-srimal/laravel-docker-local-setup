#!/usr/bin/make

SHELL = /bin/sh

UID := $(shell id -u)
GID := $(shell id -g)

export UID
export GID

local-shell:
	docker-compose -f local-docker-compose.yaml exec -u ${UID}:${GID} app sh

local-up:
	UID=${UID} GID=${GID} docker-compose -f local-docker-compose.yaml up --build -d --remove-orphans

local-down:
	docker-compose -f local-docker-compose.yaml down --remove-orphans