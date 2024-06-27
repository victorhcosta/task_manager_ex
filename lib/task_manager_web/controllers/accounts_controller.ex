defmodule TaskManagerWeb.AccountsController do
  use TaskManagerWeb, :controller

  alias TaskManagerWeb.FallbackController
  alias TaskManagerWeb.ErrorJSON

  action_fallback FallbackController

  def authenticate(conn, params) do
    with {:ok, _user, token, refresh_token} <- TaskManager.authenticate(params) do
      conn
      |>put_status(:ok)
      |>render("authenticated.json", %{token: token, refresh_token: refresh_token})
    end
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
