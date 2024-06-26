defmodule TaskManagerWeb.FallbackController do
  use TaskManagerWeb, :controller

  alias TaskManagerWeb.ErrorJSON

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |>put_status(status)
    |>put_view(ErrorJSON)
    |>render("error.json", result: result)
  end

end
