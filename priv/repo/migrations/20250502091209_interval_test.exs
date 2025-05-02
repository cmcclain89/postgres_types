defmodule PostgresTypes.Repo.Migrations.IntervalTest do
  use Ecto.Migration

  def change do
    create table(:interval_test) do
      add :timespan, :interval
    end
  end
end
