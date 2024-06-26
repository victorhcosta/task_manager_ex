defmodule TaskManagerWeb.AccountsJSON do
  import TaskManagerWeb.Gettext

  def render("created.json", %{user: user}) do
    %{
      message: gettext("User registred with success"),
      user: user
    }
  end
end
