defmodule TaskManagerWeb.TasksController do
  use TaskManagerWeb, :controller

  # alias TaskManager.Schemas.User
  alias TaskManagerWeb.FallbackController
  alias TaskManagerWeb.ErrorJSON

  action_fallback FallbackController

  def create(conn, _params) do
    conn
    |>put_status(:not_implemented)
    |>put_view(ErrorJSON)
    |>render("error.json", %{message: "/api/task/create Not implemented yet"})
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
    conn
    |>put_status(:not_implemented)
    |>put_view(ErrorJSON)
    |>render("error.json", %{message: "/api/task/get_user_tasks Not implemented yet"})
  end
end
