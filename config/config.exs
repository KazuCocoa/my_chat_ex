# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :my_chat_ex,
  ecto_repos: [MyChatEx.Repo]

# Configures the endpoint
config :my_chat_ex, MyChatEx.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "r9qqJOBvb1aACGRLRO4tPmNZV0y3S7GK9nPnH1ErLXKNBSsiHJTZ7MJJSztbO/kM",
  render_errors: [view: MyChatEx.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyChatEx.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
