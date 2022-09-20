defmodule Exmeal.Users.Create do
  alias Exmeal.{Error, Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, _user} = result), do: result
  defp handle_insert({:error, errors}), do: {:error, Error.build(:bad_request, errors)}
end
