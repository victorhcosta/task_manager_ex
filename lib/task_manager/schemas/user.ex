defmodule TaskManager.Schemas.User do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias TaskManager.Schemas.Task

  @primary_key {:user_id, Ecto.UUID, autogenerate: true}

  @derive {Jason.Encoder, only: [:user_id, :name, :email]}

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many :tasks, Task, foreign_key: :user_id

    timestamps(type: :utc_datetime)
  end

  def changeset(attrs) do
    %__MODULE__{}
    |>cast(attrs, [:name, :email, :password])
    |>validate_required([:name, :email, :password])
    |>unique_constraint(:email)
    |>validate_format(:email, ~r/@/)
    |>validate_length(:password, min: 6)
    |>put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    changeset
    |>put_change(:password_hash, Bcrypt.hash_pwd_salt(password))
    |>delete_change(:password)
  end

  defp put_password_hash(changeset), do: changeset
end
