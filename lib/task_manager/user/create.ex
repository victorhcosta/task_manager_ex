defmodule TaskManager.User.Create do
  @moduledoc false

  alias TaskManager.{Repo, Schemas.User}

  def call(params) do
    params
    |>User.changeset()
    |>Repo.insert()
    |>handle_insert()
  end

  defp handle_insert({:ok, %User{}} = user), do: user

  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
