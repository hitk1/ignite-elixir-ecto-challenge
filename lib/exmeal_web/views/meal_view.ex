defmodule ExmealWeb.MealsView do
  use ExmealWeb, :view

  alias Exmeal.Meal

  def render("meal_created.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal created successfully!",
      meal: %{
        id: meal.id,
        descricao: meal.descricao
      }
    }
  end

  def render("meal.json", %{meal: %Meal{} = meal}) do
    %{
      id: meal.id,
      descricao: meal.descricao,
      data: meal.data,
      calorias: meal.calorias
    }
  end
end
