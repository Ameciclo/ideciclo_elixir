defmodule Ideciclo.API.City do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cities" do
    field :city, :string
    field :state, :string
    has_many :reviews, Ideciclo.API.CityReview
  end

  @doc false
  def changeset(city, attrs) do
    city
    |> cast(attrs, [:city, :state])
    |> validate_required([:city, :state])
  end
end
