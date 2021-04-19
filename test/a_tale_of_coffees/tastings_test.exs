defmodule ATaleOfCoffees.TastingsTest do
  use ATaleOfCoffees.DataCase

  alias ATaleOfCoffees.Tastings

  describe "brews" do
    alias ATaleOfCoffees.Tastings.Brew

    @valid_attrs %{created_by: "some created_by", description: "some description", title: "some title"}
    @update_attrs %{created_by: "some updated created_by", description: "some updated description", title: "some updated title"}
    @invalid_attrs %{created_by: nil, description: nil, title: nil}

    def brew_fixture(attrs \\ %{}) do
      {:ok, brew} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tastings.create_brew()

      brew
    end

    test "list_brews/0 returns all brews" do
      brew = brew_fixture()
      assert Tastings.list_brews() == [brew]
    end

    test "get_brew!/1 returns the brew with given id" do
      brew = brew_fixture()
      assert Tastings.get_brew!(brew.id) == brew
    end

    test "create_brew/1 with valid data creates a brew" do
      assert {:ok, %Brew{} = brew} = Tastings.create_brew(@valid_attrs)
      assert brew.created_by == "some created_by"
      assert brew.description == "some description"
      assert brew.title == "some title"
    end

    test "create_brew/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tastings.create_brew(@invalid_attrs)
    end

    test "update_brew/2 with valid data updates the brew" do
      brew = brew_fixture()
      assert {:ok, %Brew{} = brew} = Tastings.update_brew(brew, @update_attrs)
      assert brew.created_by == "some updated created_by"
      assert brew.description == "some updated description"
      assert brew.title == "some updated title"
    end

    test "update_brew/2 with invalid data returns error changeset" do
      brew = brew_fixture()
      assert {:error, %Ecto.Changeset{}} = Tastings.update_brew(brew, @invalid_attrs)
      assert brew == Tastings.get_brew!(brew.id)
    end

    test "delete_brew/1 deletes the brew" do
      brew = brew_fixture()
      assert {:ok, %Brew{}} = Tastings.delete_brew(brew)
      assert_raise Ecto.NoResultsError, fn -> Tastings.get_brew!(brew.id) end
    end

    test "change_brew/1 returns a brew changeset" do
      brew = brew_fixture()
      assert %Ecto.Changeset{} = Tastings.change_brew(brew)
    end
  end
end
