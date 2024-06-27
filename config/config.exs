# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

defmodule Env do
  def load do
    File.stream!(".env")
    |> Stream.map(&String.trim/1)
    |> Stream.filter(&(&1 != ""))
    |> Stream.filter(&(!String.starts_with?(&1, "#")))
    |> Enum.each(fn line ->
      [key, value] = String.split(line, "=", parts: 2)
      System.put_env(String.trim(key), String.trim(value))
    end)
  end
end

Env.load()

config :task_manager,
  ecto_repos: [TaskManager.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :task_manager, TaskManagerWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: TaskManagerWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: TaskManager.PubSub,
  live_view: [signing_salt: "6HZNBaGX"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :task_manager, TaskManager.Mailer,
  adapter: Swoosh.Adapters.SMTP,
  relay: "localhost",
  port: 1025,
  username: "",
  passowrd: "",
  tls: :never,
  aut: :never

config :task_manager, TaskManager.Guardian,
  issuer: "task_manager",
  secret_key: System.get_env("JWT_SECRET"),
  token_ttl: %{
    "access" => {System.get_env("JWT_ACCESS_EXPIRES_IN", "1800"), :seconds},
    "refresh" => {System.get_env("JWT_REFRESH_ACCESS_EXPIRES_IN", "3600"), :seconds}
  }

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
