defmodule MiniBlogWeb.Schema.Types.CommentType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: MiniBlog.Repo

  alias MiniBlog.Accounts.User
  alias MiniBlog.Blog.Post
  
  object :comment_type do
    field :id, :id
    field :content, :string
    field :user, :user_type, resolve: assoc(User)
    field :post, :post_type, resolve: assoc(Post)
  end

  input_object :comment_input_type do
    field :content, non_null(:string)
    field :post_id, non_null(:id)
  end
end
