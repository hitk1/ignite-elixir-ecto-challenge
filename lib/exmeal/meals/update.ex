defmodule Exmeal.Meals.Update do
  alias Exmeal.{Repo, Error, Meal}
  alias Ecto.UUID

  def call(%{"id" => id} = params) do
    with {:ok, uuid} <- UUID.cast(id),
         meal <- Repo.get(Meal, uuid) do
      execute_update(meal, params)
    else
      :error -> {:error, Error.build_invalid_id()}
      nil -> {:error, Error.build_not_found()}
    end
  end

  defp execute_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
