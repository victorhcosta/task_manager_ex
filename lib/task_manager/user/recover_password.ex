defmodule TaskManager.User.RecoverPassword do
  @moduledoc false

  import TaskManagerWeb.Gettext

  alias TaskManager.{Repo, Schemas.User}

  def call(email) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, %{result: gettext("Doesn't exist registered user with this email"), status: :not_found}}
      user ->
        updated_password = generate_random_password()

        case user
        |>User.password_changeset(%{password: updated_password})
        |>Repo.update() do
          {:ok, updated_user} -> {:ok, updated_user, updated_password}
          {:error, _} -> {:error, reason: "Failed to update password"}
        end
    end
  end

  defp generate_random_password() do
    letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    combined_list = letters ++ numbers

    quantity_chars = Enum.random([6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26])

    for _ <- 1..quantity_chars do
      Enum.random(combined_list)
    end
    |> Enum.join("")
  end
end
