defmodule Loggex do
  require IEx
  use Plug.Router

  plug :match
  plug :dispatch

  def start do
    Plug.Adapters.Cowboy.http Loggex, [], port: 6438
  end

  def stop do
    Plug.Adapters.Cowboy.shutdown Loggex.HTTP
  end
  post "/log" do
    send_resp(conn, 200, "No Response")
  end

end
