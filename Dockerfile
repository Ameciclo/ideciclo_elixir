FROM elixir:latest as builder
ENV MIX_ENV=prod
WORKDIR /ideciclo
COPY mix.* ./
COPY lib ./lib
RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y inotify-tools && \
    mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get --only prod && \
    mix deps.compile
