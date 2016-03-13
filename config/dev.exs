use Mix.Config

config :loggex, Loggex.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "loggex_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config( :exometer, report: [reporters: [{:exometer_report_influxdb, [
        protocol: :http,
        port: 8086,
        host: "localhost",
        db: "exometer",
        tags: ["loggex"]
      ]}]])

config(:exometer, :subscriptions, [
                   {:exometer_report_influxdb, [:erlang, :memory], :total, 5000, true, []},
                       ]
                   )
config(:elixometer, reporter: :exometer_report_influxdb, env: Mix.env, metric_prefix: "loggex")

