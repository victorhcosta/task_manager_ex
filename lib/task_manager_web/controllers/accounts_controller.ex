defmodule TaskManagerWeb.AccountsController do
  use TaskManagerWeb, :controller

  alias TaskManagerWeb.FallbackController
  alias TaskManagerWeb.ErrorJSON

  action_fallback FallbackController

  def authenticate(conn, _params) do
    conn
    |>put_status(:not_implemented)
    |>put_view(ErrorJSON)
    |>render("error.json", %{message: "/api/login Not implemented yet"})
  end

  def revalidate(conn, _params) do
    conn
    |>put_status(:not_implemented)
    |>put_view(ErrorJSON)
    |>render("error.json", %{message: "/api/refresh Not implemented yet"})
  end

  def logout(conn, _params) do
    conn
    |>put_status(:not_implemented)
    |>put_view(ErrorJSON)
    |>render("error.json", %{message: "/api/logout Not implemented yet"})
  end
end
