defmodule MiniBlog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :content, :text
      add :published, :boolean
      add :user_id, references(
      	:users,
      	column: :user_id,
      	on_delete: :delete_all,
      	type: :uuid
      )
      timestamps()
    end
    create(index(:posts, :user_id))
  end
end
