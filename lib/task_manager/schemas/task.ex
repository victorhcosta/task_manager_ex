defmodule TaskManager.Schemas.Task do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias TaskManager.Schemas.User

  @statuses ~w[pending in_progress completed cancelled]a

  schema "tasks" do
    field :description, :string
    field :title, :string
    field :status, :string, default: "pending"
    belongs_to :user, User, type: Ecto.UUID, references: :user_id, foreign_key: :user_id

    timestamps(type: :utc_datetime)
  end

  def changeset(task, attrs) do
    task
    |>cast(attrs, [:title, :description, :status, :user_id])
    |>validate_required([:title, :description, :status, :user_id])
    |>validate_inclusion(:status, @statuses)
  end

  def statuses, do: @statuses
end
