defmodule Yepp.Repo.Migrations.CreateSales do
  use Ecto.Migration

  def change do
    create table(:sales) do
      add :name, :string
      add :description, :text
      add :status, :string
      add :start, :naive_datetime
      add :end, :naive_datetime

      timestamps()
    end
  end
end
