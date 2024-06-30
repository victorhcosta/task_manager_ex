defmodule TaskManager.Tasks.Create do
  @moduledoc false

  alias TaskManager.{Repo, Schemas.Task}

  def call(task, user_id) do
    task
      |> Map.put_new("user_id", user_id)
      |> Task.changeset()
      |> Repo.insert()
      |> handle_insert()
  end

  defp handle_insert({:ok, %Task{}} = task), do: task

  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
