defmodule HardThingRule.HardThingControllerTest do
  use HardThingRule.ConnCase

  alias HardThingRule.HardThing
  @valid_attrs %{email: "some content", objective: "some content", owner: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, hard_thing_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing hard things"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, hard_thing_path(conn, :new)
    assert html_response(conn, 200) =~ "New hard thing"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, hard_thing_path(conn, :create), hard_thing: @valid_attrs
    assert redirected_to(conn) == hard_thing_path(conn, :index)
    assert Repo.get_by(HardThing, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, hard_thing_path(conn, :create), hard_thing: @invalid_attrs
    assert html_response(conn, 200) =~ "New hard thing"
  end

  test "shows chosen resource", %{conn: conn} do
    hard_thing = Repo.insert! %HardThing{}
    conn = get conn, hard_thing_path(conn, :show, hard_thing)
    assert html_response(conn, 200) =~ "Show hard thing"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, hard_thing_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    hard_thing = Repo.insert! %HardThing{}
    conn = get conn, hard_thing_path(conn, :edit, hard_thing)
    assert html_response(conn, 200) =~ "Edit hard thing"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    hard_thing = Repo.insert! %HardThing{}
    conn = put conn, hard_thing_path(conn, :update, hard_thing), hard_thing: @valid_attrs
    assert redirected_to(conn) == hard_thing_path(conn, :show, hard_thing)
    assert Repo.get_by(HardThing, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    hard_thing = Repo.insert! %HardThing{}
    conn = put conn, hard_thing_path(conn, :update, hard_thing), hard_thing: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit hard thing"
  end

  test "deletes chosen resource", %{conn: conn} do
    hard_thing = Repo.insert! %HardThing{}
    conn = delete conn, hard_thing_path(conn, :delete, hard_thing)
    assert redirected_to(conn) == hard_thing_path(conn, :index)
    refute Repo.get(HardThing, hard_thing.id)
  end
end
