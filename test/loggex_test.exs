defmodule LoggexTest do
  use ExUnit.Case
  doctest Loggex

  #test the start method of loggex
  #start should start the server
  
  setup do
    Loggex.start
    on_exit fn ->
      Loggex.stop
    end
    :ok
  end

  test "route exists" do
    {:ok, response} = HTTPoison.post "localhost:6438/log", "", [] 
    assert response.status_code == 200
  end
end
