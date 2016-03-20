use Mix.Config
config :loggex, Loggex.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox,
  username: "runner",
  password: "semaphoredb",
  database: "loggex_test",
  size: 1

