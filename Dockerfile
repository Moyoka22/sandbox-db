# syntax=docker/dockerfile:1
FROM postgres:16

ENV POSTGRES_HOST_AUTH_METHOD 'trust'
RUN apt update && apt install -y curl && mkdir -p /data/lib

COPY ./lib/* /docker-entrypoint-initdb.d




