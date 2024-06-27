defmodule TaskManager.Accounts.Authenticate do
  @moduledoc false

  import TaskManagerWeb.Gettext

  alias TaskManager.{Repo, Schemas.User, Guardian}

  def call(%{"email" => email, "password" => password}) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, :not_found}
      %User{} = user ->
        if Bcrypt.verify_pass(password, user.password_hash) do
          token = generate_jwt(user, "token")
          refresh_token = generate_jwt(user, "refresh_token")
          {:ok, user, token, refresh_token}
        else
          {:error, dgettext("errors", "User not found")}
        end
    end
  end

  defp generate_jwt(user, "token") do
    {:ok, token, _claims} = Guardian.encode_and_sign(user, %{
      "user_id" => user.user_id,
      "name" => user.name,
      "email" => user.email
    }, token_type: "access")
    token
  end

  defp generate_jwt(user, "refresh_token") do
    {:ok, token, _claims} = Guardian.encode_and_sign(user, %{
      "user_id" => user.user_id,
      "name" => user.name,
      "email" => user.email
    }, token_type: "refresh")
    token
  end
end
