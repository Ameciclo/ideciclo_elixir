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
      assert API.list_cities() == [city]
    end

    test "get_city!/1 returns the city with given id" do
      city = city_fixture()
      assert API.get_city!(city.id) == city
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
      assert city == API.get_city!(city.id)
    end

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

  describe "users" do
    alias Ideciclo.API.User

    @valid_attrs %{age: 42, name: "some name"}
    @update_attrs %{age: 43, name: "some updated name"}
    @invalid_attrs %{age: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> API.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert API.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert API.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = API.create_user(@valid_attrs)
      assert user.age == 42
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = API.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = API.update_user(user, @update_attrs)
      assert user.age == 43
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = API.update_user(user, @invalid_attrs)
      assert user == API.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = API.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> API.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = API.change_user(user)
    end
  end

  describe "city_reviews" do
    alias Ideciclo.API.CityReview

    @valid_attrs %{city: "some city", ideciclo_rating: 120.5, year: 42}
    @update_attrs %{city: "some updated city", ideciclo_rating: 456.7, year: 43}
    @invalid_attrs %{city: nil, ideciclo_rating: nil, year: nil}

    def city_review_fixture(attrs \\ %{}) do
      {:ok, city_review} =
        attrs
        |> Enum.into(@valid_attrs)
        |> API.create_city_review()

      city_review
    end

    test "list_city_reviews/0 returns all city_reviews" do
      city_review = city_review_fixture()
      assert API.list_city_reviews() == [city_review]
    end

    test "get_city_review!/1 returns the city_review with given id" do
      city_review = city_review_fixture()
      assert API.get_city_review!(city_review.id) == city_review
    end

    test "create_city_review/1 with valid data creates a city_review" do
      assert {:ok, %CityReview{} = city_review} = API.create_city_review(@valid_attrs)
      assert city_review.city == "some city"
      assert city_review.ideciclo_rating == 120.5
      assert city_review.year == 42
    end

    test "create_city_review/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = API.create_city_review(@invalid_attrs)
    end

    test "update_city_review/2 with valid data updates the city_review" do
      city_review = city_review_fixture()
      assert {:ok, %CityReview{} = city_review} = API.update_city_review(city_review, @update_attrs)
      assert city_review.city == "some updated city"
      assert city_review.ideciclo_rating == 456.7
      assert city_review.year == 43
    end

    test "update_city_review/2 with invalid data returns error changeset" do
      city_review = city_review_fixture()
      assert {:error, %Ecto.Changeset{}} = API.update_city_review(city_review, @invalid_attrs)
      assert city_review == API.get_city_review!(city_review.id)
    end

    test "delete_city_review/1 deletes the city_review" do
      city_review = city_review_fixture()
      assert {:ok, %CityReview{}} = API.delete_city_review(city_review)
      assert_raise Ecto.NoResultsError, fn -> API.get_city_review!(city_review.id) end
    end

    test "change_city_review/1 returns a city_review changeset" do
      city_review = city_review_fixture()
      assert %Ecto.Changeset{} = API.change_city_review(city_review)
    end
  end

  describe "structure_types" do
    alias Ideciclo.API.StructureType

    @valid_attrs %{name: "some name", typology: "some typology"}
    @update_attrs %{name: "some updated name", typology: "some updated typology"}
    @invalid_attrs %{name: nil, typology: nil}

    def structure_type_fixture(attrs \\ %{}) do
      {:ok, structure_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> API.create_structure_type()

      structure_type
    end

    test "list_structure_types/0 returns all structure_types" do
      structure_type = structure_type_fixture()
      assert API.list_structure_types() == [structure_type]
    end

    test "get_structure_type!/1 returns the structure_type with given id" do
      structure_type = structure_type_fixture()
      assert API.get_structure_type!(structure_type.id) == structure_type
    end

    test "create_structure_type/1 with valid data creates a structure_type" do
      assert {:ok, %StructureType{} = structure_type} = API.create_structure_type(@valid_attrs)
      assert structure_type.name == "some name"
      assert structure_type.typology == "some typology"
    end

    test "create_structure_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = API.create_structure_type(@invalid_attrs)
    end

    test "update_structure_type/2 with valid data updates the structure_type" do
      structure_type = structure_type_fixture()
      assert {:ok, %StructureType{} = structure_type} = API.update_structure_type(structure_type, @update_attrs)
      assert structure_type.name == "some updated name"
      assert structure_type.typology == "some updated typology"
    end

    test "update_structure_type/2 with invalid data returns error changeset" do
      structure_type = structure_type_fixture()
      assert {:error, %Ecto.Changeset{}} = API.update_structure_type(structure_type, @invalid_attrs)
      assert structure_type == API.get_structure_type!(structure_type.id)
    end

    test "delete_structure_type/1 deletes the structure_type" do
      structure_type = structure_type_fixture()
      assert {:ok, %StructureType{}} = API.delete_structure_type(structure_type)
      assert_raise Ecto.NoResultsError, fn -> API.get_structure_type!(structure_type.id) end
    end

    test "change_structure_type/1 returns a structure_type changeset" do
      structure_type = structure_type_fixture()
      assert %Ecto.Changeset{} = API.change_structure_type(structure_type)
    end
  end

  describe "structures" do
    alias Ideciclo.API.Structure

    @valid_attrs %{extension: 120.5, max_speed: 42, street: "some street"}
    @update_attrs %{extension: 456.7, max_speed: 43, street: "some updated street"}
    @invalid_attrs %{extension: nil, max_speed: nil, street: nil}

    def structure_fixture(attrs \\ %{}) do
      {:ok, structure} =
        attrs
        |> Enum.into(@valid_attrs)
        |> API.create_structure()

      structure
    end

    test "list_structures/0 returns all structures" do
      structure = structure_fixture()
      assert API.list_structures() == [structure]
    end

    test "get_structure!/1 returns the structure with given id" do
      structure = structure_fixture()
      assert API.get_structure!(structure.id) == structure
    end

    test "create_structure/1 with valid data creates a structure" do
      assert {:ok, %Structure{} = structure} = API.create_structure(@valid_attrs)
      assert structure.extension == 120.5
      assert structure.max_speed == 42
      assert structure.street == "some street"
    end

    test "create_structure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = API.create_structure(@invalid_attrs)
    end

    test "update_structure/2 with valid data updates the structure" do
      structure = structure_fixture()
      assert {:ok, %Structure{} = structure} = API.update_structure(structure, @update_attrs)
      assert structure.extension == 456.7
      assert structure.max_speed == 43
      assert structure.street == "some updated street"
    end

    test "update_structure/2 with invalid data returns error changeset" do
      structure = structure_fixture()
      assert {:error, %Ecto.Changeset{}} = API.update_structure(structure, @invalid_attrs)
      assert structure == API.get_structure!(structure.id)
    end

    test "delete_structure/1 deletes the structure" do
      structure = structure_fixture()
      assert {:ok, %Structure{}} = API.delete_structure(structure)
      assert_raise Ecto.NoResultsError, fn -> API.get_structure!(structure.id) end
    end

    test "change_structure/1 returns a structure changeset" do
      structure = structure_fixture()
      assert %Ecto.Changeset{} = API.change_structure(structure)
    end
  end

  describe "reviews" do
    alias Ideciclo.API.Review

    @valid_attrs %{adequacy_rating: 120.5, average_rating: 120.5, avg_structure_width: 120.5, bidirectionality_rating: 120.5, comfort_rating: 120.5, hor_cross_sign_rating: 120.5, hor_sign_condition_rating: 120.5, hor_sign_rating: 120.5, obstacles_rating: 120.5, pattern_paint_rating: 120.5, pavement_condition_rating: 120.5, protection_rating: 120.5, reviewed_at: ~D[2010-04-17], reviewer: "some reviewer", risk_rating: 120.5, safety_rating: 120.5, shading_rating: 120.5, sinuosity_rating: 120.5, speed_control_rating: 120.5, type_pavement_rating: 120.5, ver_cross_sign_rating: 120.5, ver_sign_rating: 120.5}
    @update_attrs %{adequacy_rating: 456.7, average_rating: 456.7, avg_structure_width: 456.7, bidirectionality_rating: 456.7, comfort_rating: 456.7, hor_cross_sign_rating: 456.7, hor_sign_condition_rating: 456.7, hor_sign_rating: 456.7, obstacles_rating: 456.7, pattern_paint_rating: 456.7, pavement_condition_rating: 456.7, protection_rating: 456.7, reviewed_at: ~D[2011-05-18], reviewer: "some updated reviewer", risk_rating: 456.7, safety_rating: 456.7, shading_rating: 456.7, sinuosity_rating: 456.7, speed_control_rating: 456.7, type_pavement_rating: 456.7, ver_cross_sign_rating: 456.7, ver_sign_rating: 456.7}
    @invalid_attrs %{adequacy_rating: nil, average_rating: nil, avg_structure_width: nil, bidirectionality_rating: nil, comfort_rating: nil, hor_cross_sign_rating: nil, hor_sign_condition_rating: nil, hor_sign_rating: nil, obstacles_rating: nil, pattern_paint_rating: nil, pavement_condition_rating: nil, protection_rating: nil, reviewed_at: nil, reviewer: nil, risk_rating: nil, safety_rating: nil, shading_rating: nil, sinuosity_rating: nil, speed_control_rating: nil, type_pavement_rating: nil, ver_cross_sign_rating: nil, ver_sign_rating: nil}

    def review_fixture(attrs \\ %{}) do
      {:ok, review} =
        attrs
        |> Enum.into(@valid_attrs)
        |> API.create_review()

      review
    end

    test "list_reviews/0 returns all reviews" do
      review = review_fixture()
      assert API.list_reviews() == [review]
    end

    test "get_review!/1 returns the review with given id" do
      review = review_fixture()
      assert API.get_review!(review.id) == review
    end

    test "create_review/1 with valid data creates a review" do
      assert {:ok, %Review{} = review} = API.create_review(@valid_attrs)
      assert review.adequacy_rating == 120.5
      assert review.average_rating == 120.5
      assert review.avg_structure_width == 120.5
      assert review.bidirectionality_rating == 120.5
      assert review.comfort_rating == 120.5
      assert review.hor_cross_sign_rating == 120.5
      assert review.hor_sign_condition_rating == 120.5
      assert review.hor_sign_rating == 120.5
      assert review.obstacles_rating == 120.5
      assert review.pattern_paint_rating == 120.5
      assert review.pavement_condition_rating == 120.5
      assert review.protection_rating == 120.5
      assert review.reviewed_at == ~D[2010-04-17]
      assert review.reviewer == "some reviewer"
      assert review.risk_rating == 120.5
      assert review.safety_rating == 120.5
      assert review.shading_rating == 120.5
      assert review.sinuosity_rating == 120.5
      assert review.speed_control_rating == 120.5
      assert review.type_pavement_rating == 120.5
      assert review.ver_cross_sign_rating == 120.5
      assert review.ver_sign_rating == 120.5
    end

    test "create_review/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = API.create_review(@invalid_attrs)
    end

    test "update_review/2 with valid data updates the review" do
      review = review_fixture()
      assert {:ok, %Review{} = review} = API.update_review(review, @update_attrs)
      assert review.adequacy_rating == 456.7
      assert review.average_rating == 456.7
      assert review.avg_structure_width == 456.7
      assert review.bidirectionality_rating == 456.7
      assert review.comfort_rating == 456.7
      assert review.hor_cross_sign_rating == 456.7
      assert review.hor_sign_condition_rating == 456.7
      assert review.hor_sign_rating == 456.7
      assert review.obstacles_rating == 456.7
      assert review.pattern_paint_rating == 456.7
      assert review.pavement_condition_rating == 456.7
      assert review.protection_rating == 456.7
      assert review.reviewed_at == ~D[2011-05-18]
      assert review.reviewer == "some updated reviewer"
      assert review.risk_rating == 456.7
      assert review.safety_rating == 456.7
      assert review.shading_rating == 456.7
      assert review.sinuosity_rating == 456.7
      assert review.speed_control_rating == 456.7
      assert review.type_pavement_rating == 456.7
      assert review.ver_cross_sign_rating == 456.7
      assert review.ver_sign_rating == 456.7
    end

    test "update_review/2 with invalid data returns error changeset" do
      review = review_fixture()
      assert {:error, %Ecto.Changeset{}} = API.update_review(review, @invalid_attrs)
      assert review == API.get_review!(review.id)
    end

    test "delete_review/1 deletes the review" do
      review = review_fixture()
      assert {:ok, %Review{}} = API.delete_review(review)
      assert_raise Ecto.NoResultsError, fn -> API.get_review!(review.id) end
    end

    test "change_review/1 returns a review changeset" do
      review = review_fixture()
      assert %Ecto.Changeset{} = API.change_review(review)
    end
  end
end
