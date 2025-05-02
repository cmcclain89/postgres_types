defmodule PostgresTypes.EctoTypeDefs.EctoCubic do
  alias PostgresTypes.Type.Cubic

  @behaviour Ecto.Type
  def type, do: :cubic

  def cast(%{"x" => x, "y" => y, "z" => z}) when is_number(x) and is_number(y) and is_number(z) do
    {:ok, %Cubic{x: x, y: y, z: z}}
  end

  def cast(%{x: x, y: y, z: z}) when is_number(x) and is_number(y) and is_number(z) do
    {:ok, %Cubic{x: x, y: y, z: z}}
  end

  def cast(%Cubic{} = c), do: {:ok, c}
  def cast(_), do: :error

  def load({x, y, z}) when is_number(x) and is_number(y) and is_number(z) do
    {:ok, %Cubic{x: x, y: y, z: z}}
  end

  def dump(%Cubic{x: x, y: y, z: z}) do
    {:ok, {x, y, z}}
  end

  def dump(_), do: :error

  def equal?(nil, nil), do: true
  def equal?(nil, _), do: false
  def equal?(_, nil), do: false

  def equal?(left, right) do
    # To be honest, I can't trigger this callback like I did with Postgrex.Interval.
    left.x == right.x and
      left.y == right.y and
      left.z == right.z
  end

  def embed_as(_format) do
    :self
  end
end
