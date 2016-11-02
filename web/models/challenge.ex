defmodule HardThingRule.Challenge do
  use HardThingRule.Web, :model

  schema "challenges" do
    field :objective, :string
    field :owner_name, :string
    field :email, :string
    has_many :check_ins, HardThingRule.CheckIn

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:objective, :owner_name, :email])
    |> validate_required([:objective, :owner_name, :email])
  end
end
