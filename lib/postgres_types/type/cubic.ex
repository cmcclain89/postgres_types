defmodule PostgresTypes.Type.Cubic do
  @enforce_keys [:x, :y, :z]
  defstruct [:x, :y, :z]
end
