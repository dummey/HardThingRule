defmodule HardThingRule.CheckIn do
  use HardThingRule.Web, :model

  schema "check_ins" do
    field :score, :integer
    field :comment, :string
    field :date, Ecto.Date
    belongs_to :challenge, HardThingRule.Challenge

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:score, :comment, :date])
    |> validate_required([:score, :comment, :date])
  end
end
