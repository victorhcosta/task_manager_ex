defmodule TaskManagerWeb.TasksController do
  use TaskManagerWeb, :controller

  alias TaskManager.Schemas.Task
  alias TaskManagerWeb.FallbackController
  alias TaskManagerWeb.ErrorJSON

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Task{} = task} <- TaskManager.create_task(params, conn.assigns.user_id) do
      conn
      |>put_status(:ok)
      |>render("create.json", task: task)
    end
  end

  def update(conn, _params) do
    conn
    |>put_status(:not_implemented)
    |>put_view(ErrorJSON)
    |>render("error.json", %{message: "/api/task/update Not implemented yet"})
  end

  def delete(conn, _params) do
    conn
    |>put_status(:not_implemented)
    |>put_view(ErrorJSON)
    |>render("error.json", %{message: "/api/task/delete Not implemented yet"})
  end

  def get_task(conn, _params) do
    conn
    |>put_status(:not_implemented)
    |>put_view(ErrorJSON)
    |>render("error.json", %{message: "/api/task/get_task Not implemented yet"})
  end

  def get_user_tasks(conn, _params) do
    with {:ok, tasks} <- TaskManager.get_user_tasks(conn.assigns.user_id) do
      conn
      |>put_status(:ok)
      |>render("list.json", tasks: tasks)
    end
  end
end
