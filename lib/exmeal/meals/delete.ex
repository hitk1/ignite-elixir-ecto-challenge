defmodule Exmeal.Meals.Delete do
  alias Ecto.UUID
  alias Exmeal.{Repo, Error, Meal}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_invalid_id()}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_not_found()}
      meal -> Repo.delete(meal)
    end
  end
end
