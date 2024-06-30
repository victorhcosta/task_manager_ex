defmodule TaskManagerWeb.TasksJSON do
  @moduledoc false

  import TaskManagerWeb.Gettext

  def render("create.json", %{task: task}) do
    %{
      message: gettext("Task created with success"),
      task: task
    }
  end

  def render("list.json", %{tasks: tasks}) do

    %{tasks: render_many(tasks)}
  end

  defp render_many(tasks) do
    Enum.map(tasks, &render_one/1)
  end

  defp render_one(task) do
    %{
      task_id: task.task_id,
      title: task.title,
      description: task.description,
      status: task.status,
      user_id: task.user_id,
      inserted_at: task.inserted_at,
      updated_at: task.updated_at
    }
  end
end
