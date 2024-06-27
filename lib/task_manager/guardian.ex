defmodule TaskManager.Guardian do
  @moduledoc false

  use Guardian, otp_app: :task_manager

  # alias TaskManager.Accounts

  # def subject_for_token(_, _), do: {:error, :reason_for_error}

  def subject_for_token(user, _claims), do: {:ok, to_string(user.user_id)}

  # def resource_from_claims(_claims), do: {:error, :reason_for_error}

  def resource_from_claims(claims), do: {:ok, claims}
end
