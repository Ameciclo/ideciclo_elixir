defmodule Ideciclo.API.Structure do
  use Ecto.Schema
  import Ecto.Changeset

  schema "structures" do
    field :extension, :float
    field :max_speed, :integer
    field :street, :string
    belongs_to :city, Ideciclo.API.City
    belongs_to :structure_type, Ideciclo.API.StructureType

    timestamps()
  end

  @doc false
  def changeset(structure, attrs) do
    structure
    |> cast(attrs, [:city_id, :structure_type_id, :street, :max_speed, :extension])
    |> validate_required([:city_id, :structure_type_id, :street, :max_speed, :extension])
  end
end
