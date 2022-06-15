defmodule Exmeal.Error do
  @keys [:result, :status]
  @enforce_keys @keys

  defstruct @keys

  def build(result, status) do
    %__MODULE__{
      result: result,
      status: status
    }
  end

  def build_invalid_id, do: build("Invalid format ID", :bad_request)
  def build_not_found, do: build("Data not found", :bad_request)
end
