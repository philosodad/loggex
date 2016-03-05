defmodule Loggex do
  require IEx
  use Plug.Router
  alias Loggex.Repo
  alias Loggex.Logline
  alias Plug.Adapters.Cowboy

  plug Plug.Parsers, parsers: [:json, :urlencoded],
                     json_decoder: JSX
  plug :match
  plug :dispatch

  def start do
    Cowboy.http Loggex, [], port: 6438
    Repo.start_link
  end

  def stop do
    Cowboy.shutdown Loggex.HTTP
  end

  post "/log" do
    Logline.changeset(%Logline{}, conn.params)
    |> Repo.insert
    send_resp(conn, 200, "Request Logged")
  end

end
