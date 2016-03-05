use Mix.Config

config :loggex, Loggex.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "loggex_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"



