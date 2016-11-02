defmodule HardThingRule.ChallengeTest do
  use HardThingRule.ModelCase

  alias HardThingRule.Challenge

  @valid_attrs %{email: "some content", objective: "some content", owner_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Challenge.changeset(%Challenge{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Challenge.changeset(%Challenge{}, @invalid_attrs)
    refute changeset.valid?
  end
end
