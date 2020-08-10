defmodule Ideciclo.API.StructureType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "structure_types" do
    field :name, :string
    field :typology, :string
  end

  @doc false
  def changeset(structure_type, attrs) do
    structure_type
    |> cast(attrs, [:name, :typology])
    |> validate_required([:name, :typology])
  end
end
