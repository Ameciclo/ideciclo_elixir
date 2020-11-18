FROM elixir:latest

WORKDIR /ideciclo

RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y inotify-tools && \
    mix local.hex --force && \
    mix local.rebar --force

# Copy all dependencies files
COPY mix.* ./

# Install all production dependencies
RUN mix deps.get

# Compile all dependencies
RUN mix deps.compile

# Copy all application files
COPY . .