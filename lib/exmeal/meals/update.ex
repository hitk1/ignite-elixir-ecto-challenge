defmodule Exmeal.Meals.Update do
  alias Exmeal.{Repo, Error, Meal}
  alias Ecto.UUID

  def call(%{"id" => id} = params) do
    with {:ok, uuid} <- UUID.cast(id),
         %Meal{} = meal <- Repo.get(Meal, uuid) do
      execute_update(meal, params)
    else
      nil ->
        {:error, Error.build_not_found()}

      :error ->
        {:error, Error.build_not_found()}
    end
  end

  defp execute_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
