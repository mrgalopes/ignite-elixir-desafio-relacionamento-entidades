defmodule Exmeal.Users.Create do
  alias Exmeal.{Error, Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, _user} = result), do: result
  defp handle_insert({:error, result}), do: {:error, Error.build_user_not_found_error()}
end
