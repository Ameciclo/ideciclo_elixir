defmodule Ideciclo.API.Review do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviews" do
    field :adequacy_rating, :float
    field :average_rating, :float
    field :avg_structure_width, :float
    field :bidirectionality_rating, :float
    field :comfort_rating, :float
    field :hor_cross_sign_rating, :float
    field :hor_sign_condition_rating, :float
    field :hor_sign_rating, :float
    field :obstacles_rating, :float
    field :pattern_paint_rating, :float
    field :pavement_condition_rating, :float
    field :protection_rating, :float
    field :reviewed_at, :date
    field :reviewer, :string
    field :risk_rating, :float
    field :safety_rating, :float
    field :shading_rating, :float
    field :sinuosity_rating, :float
    field :speed_control_rating, :float
    field :type_pavement_rating, :float
    field :ver_cross_sign_rating, :float
    field :ver_sign_rating, :float
    belongs_to :structure, Ideciclo.API.Structure

    timestamps()
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(
         attrs,
         [
           :structure_id,
           :reviewed_at,
           :reviewer,
           :average_rating,
           :safety_rating,
           :comfort_rating,
           :adequacy_rating,
           :protection_rating,
           :speed_control_rating,
           :hor_cross_sign_rating,
           :avg_structure_width,
           :hor_sign_rating,
           :ver_sign_rating,
           :ver_cross_sign_rating,
           :pattern_paint_rating,
           :hor_sign_condition_rating,
           :risk_rating,
           :sinuosity_rating,
           :bidirectionality_rating,
           :shading_rating,
           :type_pavement_rating,
           :pavement_condition_rating,
           :obstacles_rating
         ]
       )
  end
end
