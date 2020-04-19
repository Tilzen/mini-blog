defmodule MiniBlogWeb.Resolvers.CommentResolver do
  alias MiniBlog.Blog

  def create_comment(_, %{input: input}, %{context: %{current_user: current_user}}) do
    comment_input = Map.merge(input, %{user_id: current_user.user_id})
    Blog.create_comment(comment_input)
  end
end
