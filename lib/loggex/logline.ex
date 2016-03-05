defmodule Loggex.Logline do
  use Ecto.Schema
  import Ecto.Changeset

  schema "loglines" do
    field :sender, :string
    field :sendtime, Ecto.DateTime
    field :responseCode, :integer
    field :body, :string
  end

  def changeset(logline, params) do
    cast(logline, params, [], [:sendtime, :responseCode, :sender, :body]) 
  end
end
