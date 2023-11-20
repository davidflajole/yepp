defmodule Yepp.AuctionTest do
  use Yepp.DataCase

  alias Yepp.Auction

  describe "sales" do
    alias Yepp.Auction.Sale

    import Yepp.AuctionFixtures

    @invalid_attrs %{name: nil, start: nil, status: nil, description: nil, end: nil}

    test "list_sales/0 returns all sales" do
      sale = sale_fixture()
      assert Auction.list_sales() == [sale]
    end

    test "get_sale!/1 returns the sale with given id" do
      sale = sale_fixture()
      assert Auction.get_sale!(sale.id) == sale
    end

    test "create_sale/1 with valid data creates a sale" do
      valid_attrs = %{name: "some name", start: ~N[2023-11-19 01:00:00], status: "some status", description: "some description", end: ~N[2023-11-19 01:00:00]}

      assert {:ok, %Sale{} = sale} = Auction.create_sale(valid_attrs)
      assert sale.name == "some name"
      assert sale.start == ~N[2023-11-19 01:00:00]
      assert sale.status == "some status"
      assert sale.description == "some description"
      assert sale.end == ~N[2023-11-19 01:00:00]
    end

    test "create_sale/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auction.create_sale(@invalid_attrs)
    end

    test "update_sale/2 with valid data updates the sale" do
      sale = sale_fixture()
      update_attrs = %{name: "some updated name", start: ~N[2023-11-20 01:00:00], status: "some updated status", description: "some updated description", end: ~N[2023-11-20 01:00:00]}

      assert {:ok, %Sale{} = sale} = Auction.update_sale(sale, update_attrs)
      assert sale.name == "some updated name"
      assert sale.start == ~N[2023-11-20 01:00:00]
      assert sale.status == "some updated status"
      assert sale.description == "some updated description"
      assert sale.end == ~N[2023-11-20 01:00:00]
    end

    test "update_sale/2 with invalid data returns error changeset" do
      sale = sale_fixture()
      assert {:error, %Ecto.Changeset{}} = Auction.update_sale(sale, @invalid_attrs)
      assert sale == Auction.get_sale!(sale.id)
    end

    test "delete_sale/1 deletes the sale" do
      sale = sale_fixture()
      assert {:ok, %Sale{}} = Auction.delete_sale(sale)
      assert_raise Ecto.NoResultsError, fn -> Auction.get_sale!(sale.id) end
    end

    test "change_sale/1 returns a sale changeset" do
      sale = sale_fixture()
      assert %Ecto.Changeset{} = Auction.change_sale(sale)
    end
  end
end
