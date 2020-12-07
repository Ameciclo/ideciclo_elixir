defmodule IdecicloWeb.Api.V1.StructureController do
  use IdecicloWeb, :controller

  alias Ideciclo.API
  alias Ideciclo.API.Structure

  action_fallback IdecicloWeb.FallbackController

  def index(conn, %{"city" => city} = _params) do
    structures = API.list_structures(city)
    render(conn, "index.json", structures: structures)
  end

  def index(conn, _params) do
    structures = API.list_structures(nil)
    render(conn, "index.json", structures: structures)
  end

  def create(conn, %{"structure" => structure_params}) do
    with {:ok, %Structure{} = structure} <- API.create_structure(structure_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.structure_path(conn, :show, structure))
      |> render("show.json", structure: structure)
    end
  end

  def show(conn, %{"id" => id}) do
    structure = API.get_structure!(id)
    render(conn, "show.json", structure: structure)
  end

  def update(conn, %{"id" => id, "structure" => structure_params}) do
    structure = API.get_structure!(id)

    with {:ok, %Structure{} = structure} <- API.update_structure(structure, structure_params) do
      render(conn, "show.json", structure: structure)
    end
  end

  def delete(conn, %{"id" => id}) do
    structure = API.get_structure!(id)

    with {:ok, %Structure{}} <- API.delete_structure(structure) do
      send_resp(conn, :no_content, "")
    end
  end
end
