# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ideciclo,
  ecto_repos: [Ideciclo.Repo]

# Configures the endpoint
config :ideciclo, IdecicloWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "L6ks9OFEtiqqVIyj6ED6LjitrE5O5hb9Cu1ubHV1B1zztjHnG/aWTAAT9ZuqPxvS",
  render_errors: [view: IdecicloWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Ideciclo.PubSub,
  live_view: [signing_salt: "7+xAWW8d"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
