defmodule IdecicloWeb.CityControllerTest do
  use IdecicloWeb.ConnCase

  alias Ideciclo.API

  @create_attrs %{
    city: "Recife",
    state: "PE"
  }

  def fixture(:city) do
    {:ok, city} = API.create_city(@create_attrs)
    city
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    setup [:create_city]
    test "lists all cities", %{conn: conn} do
      conn = get(conn, Routes.v1_city_path(conn, :index))
      assert length(json_response(conn, 200)) > 0
    end
  end

  describe "show" do
    setup [:create_city]
    test "list a single city", %{conn: conn, city: city} do
      conn = get(conn, Routes.v1_city_path(conn, :show, city.city))
      assert json_response(conn, 200)["id"] == city.id
    end
  end


  defp create_city(_) do
    city = fixture(:city)
    %{city: city}
  end
end
