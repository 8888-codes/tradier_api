FROM jwilder/dockerize:latest
FROM redis:5.0-rc-alpine
COPY --from=0 /usr/local/bin/dockerize /usr/local/bin/dockerize

WORKDIR /app
COPY .docker/redis/healthcheck    /app/healthcheck.template
COPY .docker/redis/redis.conf     /app/redis.conf.template


EXPOSE 6379
ENV PASSWORD 'not-a-real-password'

HEALTHCHECK CMD dockerize -template /app/healthcheck.template:/app/healthcheck && sh /app/healthcheck
CMD dockerize -template /app/redis.conf.template:/app/redis.conf && redis-server /app/redis.conf
