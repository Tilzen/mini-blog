defmodule MiniBlogWeb.Resolvers.UserResolver do
  alias MiniBlog.Accounts

  def users(_, _, _) do
    {:ok, Accounts.list_users()}
  end
end
