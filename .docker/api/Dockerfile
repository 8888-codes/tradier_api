FROM python:3.7
ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -yq install build-essential curl apt-transport-https redis-tools postgresql-client envsubst && \
    pip install pipenv

RUN mkdir /app
WORKDIR /app

COPY Pipfile Pipfile.lock /app/
RUN pipenv install

COPY . /app/

RUN python manage.py collectstatic --clear --noinput > /dev/null

EXPOSE 5000

CMD /app/.docker/api/docker-cmd.sh
