defmodule Loggex do
  require IEx
  use Application
  use Elixometer
  use Plug.Router
  alias Loggex.Repo
  alias Loggex.Logline
  alias Plug.Adapters.Cowboy

  plug Plug.Parsers, parsers: [:json, :urlencoded],
                     json_decoder: JSX
  plug :match
  plug :dispatch

  def start( _type, _args ), do: start

  def start do
    Cowboy.http Loggex, [], port: 6438
    Repo.start_link
  end

  def stop do
    Cowboy.shutdown Loggex.HTTP
  end

  post "/log" do
    update_spiral("loggex.count.pps", 1 , time_span: :timer.seconds(1), slot_period: 1000)
    Logline.changeset(%Logline{}, conn.params)
    |> Repo.insert
    send_resp(conn, 200, "Request Logged")
  end

  get "/ping" do
    send_resp(conn, 200, "pong")
  end
end
