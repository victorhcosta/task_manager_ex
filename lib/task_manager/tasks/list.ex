defmodule TaskManager.Tasks.List do
  @moduledoc false

  import Ecto.Query

  alias TaskManager.{Repo, Schemas.Task}

  def call(user_id) do
    tasks =
      from(Task, where: [user_id: ^user_id])
      |> Repo.all()

    {:ok, tasks}
  end
end
