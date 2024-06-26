defmodule TaskManager.Emails.UserNotifier do
  @moduledoc false

  import Swoosh.Email

  alias TaskManager.Mailer
  alias TaskManager.Emails.RenderTemplate

  def welcome(user) do
    assigns = %{name: user.name}

    html_body = RenderTemplate.render_template("welcome", assigns)

    new()
    |> to({user.name, user.email})
    |> from({"Task Manager Team", "team@task_manager.com"})
    |> subject("Welcome to Task Manager, #{user.name}!")
    |> html_body(html_body)
    |> Mailer.deliver()
  end

  def reset_password(user, temp_password) do
    assigns = %{name: user.name, temp_password: temp_password}

    html_body = RenderTemplate.render_template("reset_password", assigns)

    new()
    |> to({user.name, user.email})
    |> from({"Task Manager Team", "team@task_manager.com"})
    |> subject("New password #{user.name}!")
    |> html_body(html_body)
    |> Mailer.deliver()
  end
end
