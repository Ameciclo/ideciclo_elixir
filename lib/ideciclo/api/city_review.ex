defmodule Ideciclo.API.CityReview do
  use Ecto.Schema
  import Ecto.Changeset

 schema "city_reviews" do
    belongs_to :city, Ideciclo.API.City
    field :ideciclo_rating, :float
    field :year, :integer

    timestamps()
  end

  @doc false
  def changeset(city_review, attrs) do
    city_review
    |> cast(attrs, [:year, :ideciclo_rating])
    |> put_assoc(:city, attrs.city)
    |> validate_required([:city, :year])
  end
end
