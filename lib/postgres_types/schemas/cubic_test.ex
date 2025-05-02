defmodule PostgresTypes.Schemas.CubicTest do
  import Ecto.Changeset

  use Ecto.Schema

  schema "cubic_test" do
    field :position, PostgresTypes.EctoTypeDefs.EctoCubic
  end

  @doc false
  def changeset(interval_test, attrs) do
    interval_test
    |> cast(attrs, [:position])
    |> validate_required([:position])
  end
end
