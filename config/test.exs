use Mix.Config
config :loggex, Loggex.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox,
  username: "postgres",
  password: "runner",
  database: "semaphoredb",
  size: 1

