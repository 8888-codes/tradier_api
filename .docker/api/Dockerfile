FROM jwilder/dockerize:latest
FROM python:3.7
COPY --from=0 /usr/local/bin/dockerize /usr/local/bin/dockerize

ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive
RUN pip install pipenv

RUN mkdir /app
WORKDIR /app

COPY Pipfile Pipfile.lock /app/
RUN pipenv install

COPY . /app/

EXPOSE 5000

CMD pipenv run /app/.docker/api/docker-cmd.sh
