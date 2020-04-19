defmodule MiniBlogWeb.Resolvers.PostResolver do
  alias MiniBlog.Blog

  def create_post(_, %{input: input}, %{context: %{current_user: current_user}}) do
    post_input = Map.merge(input, %{user_id: current_user.user_id})
    Blog.create_post(post_input)
  end
end
