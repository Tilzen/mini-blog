defmodule MiniBlog.Guardian do
  use Guardian, otp_app: :mini_blog
  
  alias MiniBlog.Accounts

  def subject_for_token(%Accounts.User{} = user, _claims), do: {:ok, to_string(user.user_id)}
  def subject_for_token(_, _), do: {:error, :reason_for_error}

  def resource_for_claims(_claims), do: {:error, :reason_for_error}
  def resource_for_claims(%{sub: id}) do
    case Accounts.get_user!(id) do
      nil -> {:error, :resource_not_found}
      user -> {:ok, user}
    end
  end
end
