defmodule HardThingRule.HardThingTest do
  use HardThingRule.ModelCase

  alias HardThingRule.HardThing

  @valid_attrs %{email: "some content", objective: "some content", owner: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = HardThing.changeset(%HardThing{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = HardThing.changeset(%HardThing{}, @invalid_attrs)
    refute changeset.valid?
  end
end
