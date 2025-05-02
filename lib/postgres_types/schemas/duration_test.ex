defmodule PostgresTypes.Schemas.DurationTest do
  import Ecto.Changeset

  use Ecto.Schema

  schema "interval_test" do
    field :timespan, :duration
  end

  @doc false
  def changeset(interval_test, attrs) do
    interval_test
    |> cast(attrs, [:timespan])
    |> validate_required([:timespan])
  end
end
