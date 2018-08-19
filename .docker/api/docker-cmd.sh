#!/usr/bin/env bash

set -ex

pipenv install --system

# Run any pending migrations
python manage.py migrate

# Collect the static files we need to boot the app
python manage.py collectstatic --clear --noinput  --verbosity 0

# Boot gunicorn app with 4x workers
gunicorn --access-logfile=- --error-logfile=- --bind=0.0.0.0:5000 --workers=4 tradier_api.wsgi
