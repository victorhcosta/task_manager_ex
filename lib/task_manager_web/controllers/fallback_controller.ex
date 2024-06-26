defmodule TaskManagerWeb.FallbackController do
  use TaskManagerWeb, :controller

  alias TaskManagerWeb.ErrorJSON

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |>put_status(status)
    |>put_view(ErrorJSON)
    |>render("error.json", result: result)
  end

  def call(conn, {:error, reason}) do
    conn
    |> put_status(:internal_server_error)
    |> put_view(ErrorJSON)
    |> render("error.json", result: reason)
  end

end
