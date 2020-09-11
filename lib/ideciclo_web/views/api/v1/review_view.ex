defmodule IdecicloWeb.Api.V1.ReviewView do
  use IdecicloWeb, :view
  alias IdecicloWeb.Api.V1.ReviewView
  alias IdecicloWeb.Api.V1.StructureView

  def render("index.json", %{reviews: reviews}) do
    render_many(reviews, ReviewView, "review.json")
  end

  def render("show.json", %{review: review}) do
    render_one(review, ReviewView, "review.json")
  end

  def render("review.json", %{review: review}) do
    %{
      id: review.id,
      city: review.structure.city.city,
      structure: review.structure.street,
      reviewed_at: review.reviewed_at,
      reviewer: review.reviewer,
      average_rating: review.average_rating,
      safety_rating: review.safety_rating,
      comfort_rating: review.comfort_rating,
      adequacy_rating: review.adequacy_rating,
      protection_rating: review.protection_rating,
      speed_control_rating: review.speed_control_rating,
      hor_cross_sign_rating: review.hor_cross_sign_rating,
      avg_structure_width: review.avg_structure_width,
      hor_sign_rating: review.hor_sign_rating,
      ver_sign_rating: review.ver_sign_rating,
      ver_cross_sign_rating: review.ver_cross_sign_rating,
      pattern_paint_rating: review.pattern_paint_rating,
      hor_sign_condition_rating: review.hor_sign_condition_rating,
      risk_rating: review.risk_rating,
      sinuosity_rating: review.sinuosity_rating,
      bidirectionality_rating: review.bidirectionality_rating,
      shading_rating: review.shading_rating,
      type_pavement_rating: review.type_pavement_rating,
      pavement_condition_rating: review.pavement_condition_rating,
      obstacles_rating: review.obstacles_rating
    }
  end
end
