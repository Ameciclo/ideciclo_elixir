defmodule IdecicloWeb.StructureControllerTest do
  use IdecicloWeb.ConnCase

  alias Ideciclo.API
  alias Ideciclo.API.Structure

  @create_attrs %{
    extension: 120.5,
    max_speed: 42,
    street: "some street"
  }
  @update_attrs %{
    extension: 456.7,
    max_speed: 43,
    street: "some updated street"
  }
  @invalid_attrs %{extension: nil, max_speed: nil, street: nil}

  def fixture(:structure) do
    {:ok, structure} = API.create_structure(@create_attrs)
    structure
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all structures", %{conn: conn} do
      conn = get(conn, Routes.structure_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create structure" do
    test "renders structure when data is valid", %{conn: conn} do
      conn = post(conn, Routes.structure_path(conn, :create), structure: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.structure_path(conn, :show, id))

      assert %{
               "id" => id,
               "extension" => 120.5,
               "max_speed" => 42,
               "street" => "some street"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.structure_path(conn, :create), structure: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update structure" do
    setup [:create_structure]

    test "renders structure when data is valid", %{conn: conn, structure: %Structure{id: id} = structure} do
      conn = put(conn, Routes.structure_path(conn, :update, structure), structure: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.structure_path(conn, :show, id))

      assert %{
               "id" => id,
               "extension" => 456.7,
               "max_speed" => 43,
               "street" => "some updated street"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, structure: structure} do
      conn = put(conn, Routes.structure_path(conn, :update, structure), structure: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete structure" do
    setup [:create_structure]

    test "deletes chosen structure", %{conn: conn, structure: structure} do
      conn = delete(conn, Routes.structure_path(conn, :delete, structure))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.structure_path(conn, :show, structure))
      end
    end
  end

  defp create_structure(_) do
    structure = fixture(:structure)
    %{structure: structure}
  end
end
