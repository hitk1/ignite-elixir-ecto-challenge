defmodule ExmealWeb.MealsView do
  use ExmealWeb, :view

  alias Exmeal.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal created successfully!",
      meal: %{
        id: meal.id,
        description: meal.description
      }
    }
  end

  def render("meal.json", %{meal: %Meal{} = meal}) do
    %{
      id: meal.id,
      description: meal.description,
      date: meal.date,
      calories: meal.calories
    }
  end
end
