defmodule MiniBlogWeb.Resolvers.UserResolver do
  alias MiniBlog.Accounts

  def users(_, _, _), do: {:ok, Accounts.list_users()}
  def register_user(_, %{input: input}, _), do: Accounts.create_user(input)
end
