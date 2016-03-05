use Mix.Config
config :loggex, Loggex.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox,
  username: "postgres",
  password: "postgres",
  database: "loggex_test",
  size: 1

