defmodule TaskManager.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do

    create table(:tasks, primary_key: false) do
      add :task_id, :id, primary_key: true
      add :title, :string
      add :description, :string
      add :status, :string, default: "pending"
      add :user_id, references(:users, type: :uuid, column: :user_id, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end
  end
end
