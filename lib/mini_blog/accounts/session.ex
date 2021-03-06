defmodule MiniBlog.Accounts.Session do
  alias MiniBlog.Accounts.User
  alias MiniBlog.Repo

  def authenticate(args) do
    user = Repo.get_by(User, email: String.downcase(args.email))
    
    case check_password(user, args) do
      true -> {:ok, user}
      _ -> {:error, "Não foi possível realizar login: Credenciais incorretas."}
    end
  end

  defp check_password(user, args) do
    case user do
      nil -> Comeonin.Argon2.dummy_checkpw()
      _ -> Argon2.verify_pass(args.password, user.password_hash)
    end
  end
end
