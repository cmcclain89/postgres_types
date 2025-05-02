defmodule PostgresTypes.Repo do
  use Ecto.Repo,
    otp_app: :postgres_types,
    adapter: Ecto.Adapters.Postgres
end
