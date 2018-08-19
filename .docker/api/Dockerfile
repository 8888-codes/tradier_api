FROM jwilder/dockerize:latest
FROM python:3.7
COPY --from=0 /usr/local/bin/dockerize /usr/local/bin/dockerize

ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive
RUN pip install pipenv
RUN apt-get update && \
    apt-get install curl && \
    curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && \
    chmod +x /usr/local/bin/ecs-cli

RUN mkdir /app
WORKDIR /app

COPY . /app/
RUN pipenv install --system
RUN mkdir -p /var/www/tradier-api/static /var/www/static/

EXPOSE 5000

ENV STATIC_ROOT /var/www/tradier-api/static
CMD pipenv run /app/.docker/api/docker-cmd.sh
