defmodule TaskManager.Tasks.Get do
  @moduledoc false

  alias TaskManager.{Repo, Schemas.Task}

  def call(task_id) do
    tasks = Repo.get(Task, task_id)

    {:ok, tasks}
  end
end
