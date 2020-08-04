include docker.mk

## app-update:			Update the plataform
.PHONY: app-update
app-update:
	docker-compose up php-install
	docker-compose up php-update
