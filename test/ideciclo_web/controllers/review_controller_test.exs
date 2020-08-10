defmodule IdecicloWeb.ReviewControllerTest do
  use IdecicloWeb.ConnCase

  alias Ideciclo.API
  alias Ideciclo.API.Review

  @create_attrs %{
    adequacy_rating: 120.5,
    average_rating: 120.5,
    avg_structure_width: 120.5,
    bidirectionality_rating: 120.5,
    comfort_rating: 120.5,
    hor_cross_sign_rating: 120.5,
    hor_sign_condition_rating: 120.5,
    hor_sign_rating: 120.5,
    obstacles_rating: 120.5,
    pattern_paint_rating: 120.5,
    pavement_condition_rating: 120.5,
    protection_rating: 120.5,
    reviewed_at: ~D[2010-04-17],
    reviewer: "some reviewer",
    risk_rating: 120.5,
    safety_rating: 120.5,
    shading_rating: 120.5,
    sinuosity_rating: 120.5,
    speed_control_rating: 120.5,
    type_pavement_rating: 120.5,
    ver_cross_sign_rating: 120.5,
    ver_sign_rating: 120.5
  }
  @update_attrs %{
    adequacy_rating: 456.7,
    average_rating: 456.7,
    avg_structure_width: 456.7,
    bidirectionality_rating: 456.7,
    comfort_rating: 456.7,
    hor_cross_sign_rating: 456.7,
    hor_sign_condition_rating: 456.7,
    hor_sign_rating: 456.7,
    obstacles_rating: 456.7,
    pattern_paint_rating: 456.7,
    pavement_condition_rating: 456.7,
    protection_rating: 456.7,
    reviewed_at: ~D[2011-05-18],
    reviewer: "some updated reviewer",
    risk_rating: 456.7,
    safety_rating: 456.7,
    shading_rating: 456.7,
    sinuosity_rating: 456.7,
    speed_control_rating: 456.7,
    type_pavement_rating: 456.7,
    ver_cross_sign_rating: 456.7,
    ver_sign_rating: 456.7
  }
  @invalid_attrs %{adequacy_rating: nil, average_rating: nil, avg_structure_width: nil, bidirectionality_rating: nil, comfort_rating: nil, hor_cross_sign_rating: nil, hor_sign_condition_rating: nil, hor_sign_rating: nil, obstacles_rating: nil, pattern_paint_rating: nil, pavement_condition_rating: nil, protection_rating: nil, reviewed_at: nil, reviewer: nil, risk_rating: nil, safety_rating: nil, shading_rating: nil, sinuosity_rating: nil, speed_control_rating: nil, type_pavement_rating: nil, ver_cross_sign_rating: nil, ver_sign_rating: nil}

  def fixture(:review) do
    {:ok, review} = API.create_review(@create_attrs)
    review
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all reviews", %{conn: conn} do
      conn = get(conn, Routes.review_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create review" do
    test "renders review when data is valid", %{conn: conn} do
      conn = post(conn, Routes.review_path(conn, :create), review: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.review_path(conn, :show, id))

      assert %{
               "id" => id,
               "adequacy_rating" => 120.5,
               "average_rating" => 120.5,
               "avg_structure_width" => 120.5,
               "bidirectionality_rating" => 120.5,
               "comfort_rating" => 120.5,
               "hor_cross_sign_rating" => 120.5,
               "hor_sign_condition_rating" => 120.5,
               "hor_sign_rating" => 120.5,
               "obstacles_rating" => 120.5,
               "pattern_paint_rating" => 120.5,
               "pavement_condition_rating" => 120.5,
               "protection_rating" => 120.5,
               "reviewed_at" => "2010-04-17",
               "reviewer" => "some reviewer",
               "risk_rating" => 120.5,
               "safety_rating" => 120.5,
               "shading_rating" => 120.5,
               "sinuosity_rating" => 120.5,
               "speed_control_rating" => 120.5,
               "type_pavement_rating" => 120.5,
               "ver_cross_sign_rating" => 120.5,
               "ver_sign_rating" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.review_path(conn, :create), review: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update review" do
    setup [:create_review]

    test "renders review when data is valid", %{conn: conn, review: %Review{id: id} = review} do
      conn = put(conn, Routes.review_path(conn, :update, review), review: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.review_path(conn, :show, id))

      assert %{
               "id" => id,
               "adequacy_rating" => 456.7,
               "average_rating" => 456.7,
               "avg_structure_width" => 456.7,
               "bidirectionality_rating" => 456.7,
               "comfort_rating" => 456.7,
               "hor_cross_sign_rating" => 456.7,
               "hor_sign_condition_rating" => 456.7,
               "hor_sign_rating" => 456.7,
               "obstacles_rating" => 456.7,
               "pattern_paint_rating" => 456.7,
               "pavement_condition_rating" => 456.7,
               "protection_rating" => 456.7,
               "reviewed_at" => "2011-05-18",
               "reviewer" => "some updated reviewer",
               "risk_rating" => 456.7,
               "safety_rating" => 456.7,
               "shading_rating" => 456.7,
               "sinuosity_rating" => 456.7,
               "speed_control_rating" => 456.7,
               "type_pavement_rating" => 456.7,
               "ver_cross_sign_rating" => 456.7,
               "ver_sign_rating" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, review: review} do
      conn = put(conn, Routes.review_path(conn, :update, review), review: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete review" do
    setup [:create_review]

    test "deletes chosen review", %{conn: conn, review: review} do
      conn = delete(conn, Routes.review_path(conn, :delete, review))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.review_path(conn, :show, review))
      end
    end
  end

  defp create_review(_) do
    review = fixture(:review)
    %{review: review}
  end
end
