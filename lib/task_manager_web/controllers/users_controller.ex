defmodule TaskManagerWeb.UsersController do
  use TaskManagerWeb, :controller

  alias TaskManager.Schemas.User
  alias TaskManagerWeb.FallbackController
  alias TaskManagerWeb.ErrorJSON

  action_fallback FallbackController

  def register_user(conn, params) do
    with {:ok, %User{} = user} <- TaskManager.create_user(params) do
      TaskManager.Emails.UserNotifier.welcome(user)

      conn
      |> put_status(:created)
      |> render("created.json", %{user: user})
    end
  end

  def recover_password(conn, %{"email" => email}) do
    with {:ok, %User{} = user, updated_password} <- TaskManager.recover_password(email) do
      TaskManager.Emails.UserNotifier.reset_password(user, updated_password)

      conn
      |> put_status(:ok)
      |> render("recover_password.json", %{})
    end
  end

  def update_password(conn, _params) do
    conn
    |> put_status(:not_implemented)
    |> put_view(ErrorJSON)
    |> render("error.json", %{message: "/api/user/update_password Not implemented yet"})
  end

  def update_email(conn, _params) do
    conn
    |> put_status(:not_implemented)
    |> put_view(ErrorJSON)
    |> render("error.json", %{message: "/api/user/update_email Not implemented yet"})
  end
end
