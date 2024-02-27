include docker.mk

# Create variable for docker compose command.
DC = docker compose

.PHONY: test

DRUPAL_VER ?= 10
PHP_VER ?= 8.3

test:
	cd ./tests/$(DRUPAL_VER) && PHP_VER=$(PHP_VER) ./run.sh

## composer Create command to run composer with parameters inside php container.
.PHONY: composer
composer:
	$(DC) exec -T php composer $(filter-out $@,$(MAKECMDGOALS))

