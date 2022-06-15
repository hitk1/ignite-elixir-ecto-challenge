defmodule Exmeal.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table(:meals) do
      add(:descricao, :string)
      add(:data, :date)
      add(:calorias, :integer)

      timestamps()
    end
  end
end
