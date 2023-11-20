defmodule Yepp.AuctionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Yepp.Auction` context.
  """

  @doc """
  Generate a sale.
  """
  def sale_fixture(attrs \\ %{}) do
    {:ok, sale} =
      attrs
      |> Enum.into(%{
        description: "some description",
        end: ~N[2023-11-19 01:00:00],
        name: "some name",
        start: ~N[2023-11-19 01:00:00],
        status: "some status"
      })
      |> Yepp.Auction.create_sale()

    sale
  end
end
