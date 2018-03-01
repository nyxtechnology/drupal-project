-include env_make

.PHONY: test

drupal ?= 8
php ?= 7.1

default: run

test:
	cd ./test/$(drupal)/$(php) && ./run.sh

run:
	docker-compose up -d postgres
	docker-compose up -d drupal
	docker-compose up -d traefik
	docker-compose up nginx

in:
	docker-compose exec drupal /bin/bash

in-nginx:
	docker-compose exec nginx /bin/bash

in-with-root:
	docker-compose exec --user root drupal /bin/bash

stop:
	docker-compose stop