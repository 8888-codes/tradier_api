#!/usr/bin/env bash

set -ex

# Verify the app is configured correctly
python manage.py healthcheck

# Collect the static files we need to boot the app
python manage.py collectstatic --clear --noinput

# Boot gunicorn app with 4x workers
gunicorn --access-logfile=- --error-logfile=- --bind=0.0.0.0:5000 --workers=4 backend.wsgi
