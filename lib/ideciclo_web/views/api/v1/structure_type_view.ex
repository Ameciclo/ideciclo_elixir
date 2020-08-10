defmodule IdecicloWeb.Api.V1.StructureTypeView do
  use IdecicloWeb, :view
  alias IdecicloWeb.Api.V1.StructureTypeView

  def render("index.json", %{structure_types: structure_types}) do
    %{data: render_many(structure_types, StructureTypeView, "structure_type.json")}
  end

  def render("show.json", %{structure_type: structure_type}) do
    %{data: render_one(structure_type, StructureTypeView, "structure_type.json")}
  end

  def render("structure_type.json", %{structure_type: structure_type}) do
    %{id: structure_type.id,
      name: structure_type.name,
      typology: structure_type.typology}
  end
end
