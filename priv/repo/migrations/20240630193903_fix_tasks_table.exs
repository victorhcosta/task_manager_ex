defmodule TaskManager.Repo.Migrations.FixTasksTable do
  use Ecto.Migration

  def up do
    alter table(:tasks) do
      remove :task_id
    end

    alter table(:tasks, primary_key: false) do
      add :task_id, :uuid, primary_key: true, default: fragment("uuid_generate_v4()")
    end
  end

  def down do
    alter table(:tasks) do
      remove :task_id
    end

    alter table(:tasks, primary_key: false) do
      add :task_id, :id, primary_key: true
    end
  end
end
