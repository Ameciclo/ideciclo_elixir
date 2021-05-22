defmodule Ideciclo.API.Structure do
  use Ecto.Schema
  import Ecto.Changeset

  schema "structures" do
    field :extension, :float
    field :max_speed, :integer
    field :street, :string
    field :average_rating, :float
    belongs_to :city, Ideciclo.API.City
    belongs_to :structure_type, Ideciclo.API.StructureType
    has_many :reviews, Ideciclo.API.Review

    timestamps()
  end

  @doc false
  def changeset(structure, attrs) do
    structure
    |> cast(attrs, [:city_id, :structure_type_id, :street, :max_speed, :extension, :average_rating])
    |> validate_required([:extension, :max_speed, :street])
  end
end
