defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @required_params [:descricao, :data, :calorias]

  schema "meals" do
    field(:descricao, :string)
    field(:data, :date)
    field(:calorias, :integer)

    timestamps()
  end

  def changetset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
  end
end
