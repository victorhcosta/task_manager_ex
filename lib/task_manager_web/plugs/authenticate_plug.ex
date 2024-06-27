defmodule TaskManagerWeb.Plugs.AuthenticatePlug do
  @moduledoc false

  import Plug.Conn
  import Phoenix.Controller

  alias TaskManager.Guardian

  def init(opts), do: opts

  def call(conn, _opts) do
    get_token(conn)

    case get_token(conn) do
      nil -> unauthorized(conn)
      token ->
        case Guardian.decode_and_verify(token) do
          {:ok, claims} -> assign(conn, :current_user, fetch_user_from_claims(claims))
          {:error, _reason} -> unauthorized(conn)
        end
    end
  end

  defp get_token(conn) do
      conn
      |> get_req_header("authorization")
      |> Enum.find_value(&extract_token_from_auth_header/1)
  end

  defp extract_token_from_auth_header(header) do
    case String.split(header, " ") do
      ["Bearer", token] -> token
      nil -> {:error}
    end
  end

  defp fetch_user_from_claims(claims) do
    user_id = claims |> Map.get("user_id")
    name = claims |> Map.get("name")
    email = claims |> Map.get("email")

    {user_id, name, email}
  end

  defp unauthorized(conn) do
    conn
    |> put_status(:unauthorized)
    |> json(%{error: "Unauthorized"})
    |> halt()
  end

end
