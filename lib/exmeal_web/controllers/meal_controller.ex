defmodule ExmealWeb.MealsController do
  use ExmealWeb, :controller

  alias Exmeal.Meal
  alias ExmealWeb.FallbackController

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Exmeal.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("meal_created.json", meal: meal)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- Exmeal.get_meal_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, _result} <- Exmeal.delete_meal(id) do
      conn
      |> put_status(:ok)
      |> json(%{message: "Meal deleted succesfully!"})
    end
  end
end
