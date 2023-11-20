defmodule Yepp.Auction.Sale do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sales" do
    field :name, :string
    field :start, :naive_datetime
    field :status, :string
    field :description, :string
    field :end, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(sale, attrs) do
    sale
    |> cast(attrs, [:name, :description, :status, :start, :end])
    |> validate_required([:name, :description, :status, :start, :end])
  end
end
