defmodule IdecicloWeb.Api.V1.StructureView do
  use IdecicloWeb, :view
  alias IdecicloWeb.Api.V1.StructureView
  alias IdecicloWeb.Api.V1.StructureTypeView
  alias IdecicloWeb.Api.V1.ReviewView


  def render("index.json", %{structures: structures}) do
    render_many(structures, StructureView, "structure.json")
  end

  def render("show.json", %{structure: structure}) do
    render_one(structure, StructureView, "structure.json")
  end

  def render("structure.json", %{structure: structure}) do
    %{
      id: structure.id,
      street: structure.street,
      max_speed: structure.max_speed,
      extension: structure.extension,
      city: structure.city.city,
      structure_type: render_one(structure.structure_type, StructureTypeView, "structure_type.json"),
      reviews: render_many(structure.reviews, ReviewView, "assoc_review.json")
    }
  end
end
