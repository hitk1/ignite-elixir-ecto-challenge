defmodule Exmeal.Meals.Get do
  alias Ecto.UUID
  alias Exmeal.{Meal, Error, Repo}

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_invalid_id()}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Meal, uuid) do
      nil -> {:error, Error.build_not_found()}
      meal -> {:ok, meal}
    end
  end
end
