# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mini_blog,
  ecto_repos: [MiniBlog.Repo],
  generators: [binary_id: false]

# Configures the endpoint
config :mini_blog, MiniBlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m06GAGm5KRHPWzGuMj8S+cLE6Jhh6OnekFczGAL5lbF2cqMtAETwK2WYd7IQQf8o",
  render_errors: [view: MiniBlogWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MiniBlog.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
