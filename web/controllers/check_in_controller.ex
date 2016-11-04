defmodule HardThingRule.CheckInController do
  use HardThingRule.Web, :controller

  alias HardThingRule.CheckIn

  def create(conn, %{"check_in" => check_in_params}) do
    IO.inspect check_in_params
    changeset = CheckIn.changeset(%CheckIn{date: Ecto.Date.utc}, check_in_params)
    challenge_id = check_in_params["challenge_id"]
    IO.inspect challenge_id

    case Repo.insert(changeset) do
      {:ok, _check_in} ->
        conn
        |> put_flash(:info, "Check in successfully.")
        |> redirect(to: challenge_path(conn, :show, challenge_id))
      {:error, changeset} ->
        IO.inspect changeset
        conn
        |> put_flash(:error, "Failed to check in.")
        |> redirect(to: "/")
    end
  end

end