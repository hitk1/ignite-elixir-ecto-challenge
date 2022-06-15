defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:descricao, :data, :calorias]

  schema "meals" do
    field(:descricao, :string)
    field(:data, :date)
    field(:calorias, :integer)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
