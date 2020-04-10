defmodule MiniBlog.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:user_id, Ecto.UUID, autogenerate: true}
  @derive {Phoenix.Param, key: :user_id}
  schema "users" do
    field :email, :string, unique: true
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :role, :string, default: "user"
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    fields = [
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :role
    ]
    user
    |> cast(attrs, fields)
    |> validate_required(fields)
    |> validate_format(:email, ~r/(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)/)
    |> update_change(:email, &String.downcase(&1))
    |> validate_length(:password, min: 6, max: 15)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> hash_password
  end

  defp hash_password(
    %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
  ) do
    change(changeset, Argon2.add_hash(password))
  end

  defp hash_password(changeset), do: changeset
end
