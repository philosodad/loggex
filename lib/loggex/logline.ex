defmodule Loggex.Logline do
  use Ecto.Schema
  import Ecto.Changeset

  schema "loglines" do
    field :sender, :string
    field :sendtime, Ecto.DateTime
    field :responseCode, :integer
    field :body, :string
  end
end
