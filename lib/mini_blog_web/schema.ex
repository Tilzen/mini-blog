defmodule MiniBlogWeb.Schema do
  use Absinthe.Schema

  alias MiniBlogWeb.Resolvers

  import_types MiniBlogWeb.Schema.Types

  query do
    @desc "Get a list of all users"
    field :users, list_of(:user_type) do
      resolve(&Resolvers.UserResolver.users/3)
    end
  end
end
