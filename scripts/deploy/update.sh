#!/usr/bin/env bash

cd web
drush updb -y
drush cim -y
drush cr
