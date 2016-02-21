defmodule LoggexTest do
  use ExUnit.Case
  import Ecto.Query
  doctest Loggex
  
  setup do
    :random.seed(:erlang.now)
    {:ok, repo} = Loggex.start
    on_exit fn ->
      Loggex.stop
    end
    :ok
  end

    test "route exists" do
      {:ok, response} = HTTPoison.post "localhost:6438/log", JSX.encode!(%{"sendtime" => Ecto.DateTime.to_iso8601(Ecto.DateTime.utc)}), %{"content-type" => "application/json"} 
      assert response.status_code == 200
    end

  test "route inserts a properly formatted logline into the database" do
    code = Enum.random(200..600)
    body = "\{\"body\": \"content\"\}"
    time = Ecto.DateTime.utc |> Ecto.DateTime.to_iso8601
    {:ok, response} = HTTPoison.post "localhost:6438/log", 
                                     JSX.encode!(%{sender: "http://example.com", 
                                                   sendtime: time,
                                                   responseCode: code, 
                                                   body: body}),
                                     %{"Content-Type" => "application/json"}

    query = from l in Loggex.Logline,
            where: l.responseCode == ^code,
            select: l
    logline = Loggex.Repo.one query
    assert logline.body == body
  end
end
