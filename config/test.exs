use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :my_chat_ex, MyChatEx.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :my_chat_ex, MyChatEx.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "phoenix",
  password: "phoenix",
  database: "mychatex_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
