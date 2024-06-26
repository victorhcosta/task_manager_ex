defmodule TaskManagerWeb.UsersJSON do
  import TaskManagerWeb.Gettext

  def render("created.json", %{user: user}) do
    %{
      message: gettext("User registred with success"),
      user: user
    }
  end

  def render("recover_password.json", _), do:
    %{message: gettext("Updated password sent for your email")}
end
