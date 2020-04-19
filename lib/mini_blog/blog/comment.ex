defmodule MiniBlog.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias MiniBlog.Accounts.User
  alias MiniBlog.Blog.Post

  schema "comments" do
    field :content, :string
    belongs_to(:user, User, references: :user_id, type: Ecto.UUID)
    belongs_to(:post, Post)
    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content, :user_id, :post_id])
    |> validate_required([:content, :user_id, :post_id])
  end
end
