#!/usr/bin/env bash

set -ex

pipenv install

# Run any pending migrations
pipenv run python manage.py migrate

# Collect the static files we need to boot the app
pipenv run python manage.py collectstatic --clear --noinput

# Boot gunicorn app with 4x workers
pipenv run gunicorn --access-logfile=- --error-logfile=- --bind=0.0.0.0:5000 --workers=4 tradier_api.wsgi
