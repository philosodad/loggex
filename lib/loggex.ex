defmodule Loggex do
  require IEx
  use Elixometer
  use Plug.Router
  use Plug.Builder

  plug Plug.Parsers, parsers: [:json, :urlencoded],
                     json_decoder: JSX
  plug :timefixer
  plug :match
  plug :dispatch

  def start do
    IEx.pry
    update_counter("start.count.qps", 1)
    Plug.Adapters.Cowboy.http Loggex, [], port: 6438
    Loggex.Repo.start_link
  end

  def stop do
    Plug.Adapters.Cowboy.shutdown Loggex.HTTP
  end

  @timed(key: "timed.event")
  post "/log" do
    update_counter("loggex.count.qps", 1)
    Map.keys(conn.params)
    |> Enum.reduce(%{}, fn(k,acc) -> Map.put(acc, String.to_atom(k), conn.params[k]) end)
    |> (&(Map.merge(%Loggex.Logline{}, &1))).()
    |> Loggex.Repo.insert
    send_resp(conn, 200, "Log Success")
  end

  def timefixer conn, opts do
    conn = conn.params["sendtime"]
    |> Ecto.DateTime.cast!
    |> (&(Map.put(conn.params, "sendtime", &1))).()
    |> (&(Map.put(conn, :params, &1))).()
    conn
  end

end
