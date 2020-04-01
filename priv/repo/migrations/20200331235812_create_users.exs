defmodule MiniBlog.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :user_id, :uuid, primary_key: true
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :password_hash, :string
      add :role, :string
      timestamps()
    end
  end
end
