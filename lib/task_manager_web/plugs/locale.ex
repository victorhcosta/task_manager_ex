defmodule TaskManagerWeb.Plugs.Locale do
  @moduledoc false

  import Plug.Conn

  @locales Gettext.known_locales(TaskManagerWeb.Gettext)

  def init(default), do: default

  def call(conn, _default) do
    locale = get_locale_from_header(conn) || "pt-br"
    Gettext.put_locale(TaskManagerWeb.Gettext, locale)
    conn
  end

  defp get_locale_from_header(conn) do
    conn
    |>get_req_header("accept-language")
    |>Enum.map(fn locale -> String.replace(locale, "-", "_") end)
    |>List.first()
    |>to_locale()
  end

  defp to_locale(nil), do: nil

  defp to_locale(header) do
    header
    |>String.split(",")
    |>Enum.map(&String.trim/1)
    |>Enum.find(&(&1 in @locales))
  end
end
