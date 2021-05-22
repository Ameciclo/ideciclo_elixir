defmodule Ideciclo.APITest do
  use Ideciclo.DataCase

  alias Ideciclo.API

  describe "cities" do
    alias Ideciclo.API.City

    @valid_attrs %{city: "some city", state: "some state"}
    @update_attrs %{city: "some updated city", state: "some updated state"}
    @invalid_attrs %{city: nil, state: nil}

    def city_fixture(attrs \\ %{}) do
      {:ok, city} =
        attrs
        |> Enum.into(@valid_attrs)
        |> API.create_city()

      city
    end

    test "list_cities/0 returns all cities" do
      city = city_fixture()
      assert [found_city] = API.list_cities()
      assert city.id == found_city.id
    end

    test "get_city!/1 returns the city with given id" do
      city = city_fixture()
      assert found_city = API.get_city!(city.id)
      assert city.id == found_city.id
    end

    test "create_city/1 with valid data creates a city" do
      assert {:ok, %City{} = city} = API.create_city(@valid_attrs)
      assert city.city == "some city"
      assert city.state == "some state"
    end

    test "create_city/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = API.create_city(@invalid_attrs)
    end

    test "update_city/2 with valid data updates the city" do
      city = city_fixture()
      assert {:ok, %City{} = city} = API.update_city(city, @update_attrs)
      assert city.city == "some updated city"
      assert city.state == "some updated state"
    end

    test "update_city/2 with invalid data returns error changeset" do
      city = city_fixture()
      assert {:error, %Ecto.Changeset{}} = API.update_city(city, @invalid_attrs)
      assert found_city = API.get_city!(city.id)
      assert city.id == found_city.id
    end

    @tag :skip
    test "delete_city/1 deletes the city" do
      city = city_fixture()
      assert {:ok, %City{}} = API.delete_city(city)
      assert_raise Ecto.NoResultsError, fn -> API.get_city!(city.id) end
    end

    test "change_city/1 returns a city changeset" do
      city = city_fixture()
      assert %Ecto.Changeset{} = API.change_city(city)
    end
  end

  describe "city_reviews" do
    alias Ideciclo.API.CityReview

    @valid_attrs %{city:  %{city: "some city", state: "some state"}, ideciclo_rating: 120.5, year: 42}
    @update_attrs %{city: nil, ideciclo_rating: 456.7, year: 43}
    @invalid_attrs %{city: nil, ideciclo_rating: nil, year: nil}

    def city_review_fixture(attrs \\ %{}) do
      city = city_fixture()

      {:ok, city_review} =
        @valid_attrs
        |> Map.merge(%{city_id: city.id, city: city})
        |> API.create_city_review()

      city_review
    end

    test "list_city_reviews/0 returns all city_reviews" do
      city_review = city_review_fixture()
      assert [found_city_review] = API.list_city_reviews()
      assert city_review.id == found_city_review.id
    end

    test "get_city_review!/1 returns the city_review with given id" do
      city_review = city_review_fixture()
      assert found_city_review = API.get_city_review!(city_review.id)
      assert city_review.id == found_city_review.id
    end

    test "create_city_review/1 with valid data creates a city_review" do
      assert {:ok, %CityReview{} = city_review} = API.create_city_review(@valid_attrs)
      assert city_review.city.city == "some city"
      assert city_review.ideciclo_rating == 120.5
      assert city_review.year == 42
    end

    test "create_city_review/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = API.create_city_review(@invalid_attrs)
    end
  end

end
