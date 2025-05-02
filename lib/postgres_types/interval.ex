defmodule PostgresTypes.Interval do
  # an example using a built-in Postgres type, Interval
  # this is one way to do it, and we can add more support for different types to
  # cast and such to different types. for now, this will just use postgrex interval directly
  @behaviour Ecto.Type
  def type, do: Postgrex.Interval

  # casting from input (queries, changesets)
  def cast(value = %Postgrex.Interval{}) do
    IO.inspect("casting from postgrex interval")
    IO.inspect(value)
    {:ok, value}
  end

  def cast(_), do: :error

  # loading from db
  def load(data) do
    IO.inspect("loading")
    IO.inspect(data)
    {:ok, data}
  end

  # dumping data into db
  def dump(value = %Postgrex.Interval{}) do
    IO.inspect("dump")
    IO.inspect(value)
    {:ok, value}
  end

  def dump(_), do: :error

  def equal?(nil, _), do: false
  def equal?(_, nil), do: false
  def equal?(nil, nil), do: true

  def equal?(left, right) do
    IO.inspect("equality check")
    IO.inspect(left)
    IO.inspect(right)

    left.months == right.months and
      left.days == right.days and
      left.secs == right.secs and
      left.microsecs == right.microsecs
  end

  def embed_as(format) do
    IO.inspect("embed_as")
    IO.inspect(format)
    :self
  end
end
