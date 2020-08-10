defmodule IdecicloWeb.CityReviewControllerTest do
  use IdecicloWeb.ConnCase

  alias Ideciclo.API
  alias Ideciclo.API.CityReview

  @create_attrs %{
    city: "some city",
    ideciclo_rating: 120.5,
    year: 42
  }
  @update_attrs %{
    city: "some updated city",
    ideciclo_rating: 456.7,
    year: 43
  }
  @invalid_attrs %{city: nil, ideciclo_rating: nil, year: nil}

  def fixture(:city_review) do
    {:ok, city_review} = API.create_city_review(@create_attrs)
    city_review
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all city_reviews", %{conn: conn} do
      conn = get(conn, Routes.city_review_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create city_review" do
    test "renders city_review when data is valid", %{conn: conn} do
      conn = post(conn, Routes.city_review_path(conn, :create), city_review: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.city_review_path(conn, :show, id))

      assert %{
               "id" => id,
               "city" => "some city",
               "ideciclo_rating" => 120.5,
               "year" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.city_review_path(conn, :create), city_review: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update city_review" do
    setup [:create_city_review]

    test "renders city_review when data is valid", %{conn: conn, city_review: %CityReview{id: id} = city_review} do
      conn = put(conn, Routes.city_review_path(conn, :update, city_review), city_review: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.city_review_path(conn, :show, id))

      assert %{
               "id" => id,
               "city" => "some updated city",
               "ideciclo_rating" => 456.7,
               "year" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, city_review: city_review} do
      conn = put(conn, Routes.city_review_path(conn, :update, city_review), city_review: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete city_review" do
    setup [:create_city_review]

    test "deletes chosen city_review", %{conn: conn, city_review: city_review} do
      conn = delete(conn, Routes.city_review_path(conn, :delete, city_review))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.city_review_path(conn, :show, city_review))
      end
    end
  end

  defp create_city_review(_) do
    city_review = fixture(:city_review)
    %{city_review: city_review}
  end
end
