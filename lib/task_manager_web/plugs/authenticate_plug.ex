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
          {:ok, claims} -> assign(conn, :user_id, fetch_user_from_claims(claims, "user_id"))
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

  defp fetch_user_from_claims(claims, key), do: claims |> Map.get(key)

  defp unauthorized(conn) do
    conn
    |> put_status(:unauthorized)
    |> json(%{error: "Unauthorized"})
    |> halt()
  end

end
