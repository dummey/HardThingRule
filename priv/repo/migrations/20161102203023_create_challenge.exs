defmodule HardThingRule.Repo.Migrations.CreateChallenge do
  use Ecto.Migration

  def change do
    create table(:challenges) do
      add :objective, :string
      add :owner_name, :string
      add :email, :string

      timestamps()
    end

  end
end
