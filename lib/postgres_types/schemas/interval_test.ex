defmodule PostgresTypes.Schemas.IntervalTest do
  import Ecto.Changeset

  use Ecto.Schema

  schema "interval_test" do
    field :timespan, PostgresTypes.EctoTypeDefs.Interval
  end

  @doc false
  def changeset(interval_test, attrs) do
    interval_test
    |> cast(attrs, [:timespan])
    |> validate_required([:timespan])
  end
end
