use Mix.Config
config :loggex, Loggex.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox,
  username: System.get_env["DATABASE_POSTGRESQL_USERNAME"] || "postgres",
  password: System.get_env["DATABASE_POSTGRESQL_PASSWORD"] || "postgres",
  database: "loggex_test",
  size: 1

