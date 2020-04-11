defmodule MiniBlogWeb.Schema do
  use Absinthe.Schema

  alias MiniBlogWeb.Resolvers

  import_types MiniBlogWeb.Schema.Types

  query do
    @desc "Retorna uma lista com todos os usuários."
    field :users, list_of(:user_type) do
      resolve(&Resolvers.UserResolver.users/3)
    end
  end

  mutation do
    @desc "Registra um novo usuário."
    field :register_user, type: :user_type do
      arg :input, non_null(:user_input_type)
      resolve(&Resolvers.UserResolver.register_user/3)
    end

    @desc "Realiza o login do usuário e retorna token JWT."
    field :login_user, type: :session_type do
      arg :input, non_null(:session_input_type)
      resolve(&Resolvers.SessionResolver.login_user/3)
    end
  end
end
