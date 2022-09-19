defmodule Exmeal.Meals.Create do
  alias Exmeal.{Error, Meal, Repo}

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:error, result}), do: {:error, Error.build(:bad_request, result)}
  defp handle_insert({:ok, _meal} = result), do: result
end
