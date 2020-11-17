FROM elixir:latest

RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y inotify-tools && \
    mix local.hex --force && \
    mix archive.install hex phx_new 1.5.4 --force && \
    mix local.rebar --force

COPY mix.exs .
COPY mix.lock .

WORKDIR /app

CMD ["mix", "phx.server"]
