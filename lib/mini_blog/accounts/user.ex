defmodule MiniBlog.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:user_id, Ecto.UUID, autogenerate: true}
  @derive {Phoenix.Param, key: :user_id}
  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :role, :string
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:user_id, :first_name, :last_name, :email, :password_hash, :role])
    |> validate_required([:user_id, :first_name, :last_name, :email, :password_hash, :role])
  end
end
