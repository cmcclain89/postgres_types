defmodule PostgresTypes.EctoTypeDefs.EctoCubic do
  # an example using a type I defined in Postgres, which is a 3 element tuple representing a point in 3d space (idk if "cubic" is the correct term here!)
  # its more of less the same as the Postgrex implementation
  # technically, from what I read elsewhere you can apply this in such a way where data is stored as basic types (i.e. text) 
  # but then shaped here into domain models. Not a bad idea to consider
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
