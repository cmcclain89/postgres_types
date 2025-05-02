defmodule PostgresTypes.Repo.Migrations.CubicTest do
  use Ecto.Migration

  # note: generated the type in sql, but I'll add the script here for reference
  #   create type cubic as
  #   (
  #     x float8,
  #     y float8,
  #     z float8
  #   );

  def change do
    create table(:cubic_test) do
      add :position, :cubic
    end
  end
end
