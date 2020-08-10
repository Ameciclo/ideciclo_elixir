defmodule IdecicloWeb.StructureTypeControllerTest do
  use IdecicloWeb.ConnCase

  alias Ideciclo.API
  alias Ideciclo.API.StructureType

  @create_attrs %{
    name: "some name",
    typology: "some typology"
  }
  @update_attrs %{
    name: "some updated name",
    typology: "some updated typology"
  }
  @invalid_attrs %{name: nil, typology: nil}

  def fixture(:structure_type) do
    {:ok, structure_type} = API.create_structure_type(@create_attrs)
    structure_type
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all structure_types", %{conn: conn} do
      conn = get(conn, Routes.structure_type_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create structure_type" do
    test "renders structure_type when data is valid", %{conn: conn} do
      conn = post(conn, Routes.structure_type_path(conn, :create), structure_type: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.structure_type_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "typology" => "some typology"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.structure_type_path(conn, :create), structure_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update structure_type" do
    setup [:create_structure_type]

    test "renders structure_type when data is valid", %{conn: conn, structure_type: %StructureType{id: id} = structure_type} do
      conn = put(conn, Routes.structure_type_path(conn, :update, structure_type), structure_type: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.structure_type_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "typology" => "some updated typology"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, structure_type: structure_type} do
      conn = put(conn, Routes.structure_type_path(conn, :update, structure_type), structure_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete structure_type" do
    setup [:create_structure_type]

    test "deletes chosen structure_type", %{conn: conn, structure_type: structure_type} do
      conn = delete(conn, Routes.structure_type_path(conn, :delete, structure_type))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.structure_type_path(conn, :show, structure_type))
      end
    end
  end

  defp create_structure_type(_) do
    structure_type = fixture(:structure_type)
    %{structure_type: structure_type}
  end
end
