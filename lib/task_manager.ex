defmodule TaskManager do
  @moduledoc """
  This module provides simplified access to core functions and modules.

  Access to the core module outside the task_manager directory should
  just done using this module
  """

  alias TaskManager.User.Create, as: CreateUser
  alias TaskManager.User.RecoverPassword

  alias TaskManager.Accounts.Authenticate

  alias TaskManager.Tasks.Create, as: CreateTask
  alias TaskManager.Tasks.List, as: ListUserTasks
  alias TaskManager.Tasks.Get, as: GetTaskDetails

  defdelegate create_user(user), to: CreateUser, as: :call
  defdelegate recover_password(email), to: RecoverPassword, as: :call

  defdelegate authenticate(params), to: Authenticate, as: :call

  defdelegate create_task(task, user_id), to: CreateTask, as: :call
  defdelegate get_user_tasks(user_id), to: ListUserTasks, as: :call
  defdelegate get_task_by_id(task_id), to: GetTaskDetails, as: :call
end
