defmodule TaskManager.Emails.RenderTemplate do
  @moduledoc false

  def render_template(template_name, assigns) do
    template_path =
      Path.join(["lib", "task_manager", "templates", "email", "#{template_name}.html.eex"])

      case File.read(template_path) do
        {:ok, template_content} -> EEx.eval_string(template_content, assigns: assigns)
        {:error, reason} -> {:error, reason}
      end
  end
end
