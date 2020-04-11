defmodule MiniBlog.Guardian do
  use Guardian, otp_app: :mini_blog
  
  alias MiniBlog.Accounts

  def subject_for_token(user, _claims) do
    sub = to_string(user.user_id)
    {:ok, sub}
  end

  def resource_for_claims(claims) do
    user = claims["sub"]
           |> Accounts.get_user!()
    {:ok, user}
  end

  def subject_for_token(_, _), do: {:error, :reason_for_error}
  def resource_for_claims(_claims), do: {:error, :reason_for_error}
end
