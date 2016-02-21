defmodule Loggex.Repo.Migrations.AddLoglinesTable do
  use Ecto.Migration

  def change do
    create table(:loglines) do
      add :sender, :string
      add :sendtime, :datetime
      add :responseCode, :integer
      add :body, :string
    end
  end
end
