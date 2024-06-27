defmodule TaskManagerWeb.AccountsJSON do
  import TaskManagerWeb.Gettext

  def render("authenticated.json", %{token: token, refresh_token: refresh_token}) do
    %{
      message: gettext("Token generated with success"),
      token: token,
      refresh_token: refresh_token
    }
  end

end
