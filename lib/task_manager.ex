defmodule TaskManager do
  @moduledoc """
  This module provides simplified access to core functions and modules.

  Access to the core module outside the task_manager directory should
  just done using this module
  """

  alias TaskManager.User.Create, as: CreateUser

  defdelegate create_user(params), to: CreateUser, as: :call
end
