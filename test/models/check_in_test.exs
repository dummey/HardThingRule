defmodule HardThingRule.CheckInTest do
  use HardThingRule.ModelCase

  alias HardThingRule.CheckIn

  @valid_attrs %{comment: "some content", date: %{day: 17, month: 4, year: 2010}, score: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = CheckIn.changeset(%CheckIn{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = CheckIn.changeset(%CheckIn{}, @invalid_attrs)
    refute changeset.valid?
  end
end
