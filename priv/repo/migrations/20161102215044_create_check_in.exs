defmodule HardThingRule.Repo.Migrations.CreateCheckIn do
  use Ecto.Migration

  def change do
    create table(:check_ins) do
      add :score, :integer
      add :comment, :string
      add :date, :date
      add :challenge_id, references(:challenges, on_delete: :nothing)

      timestamps()
    end

  end
end
