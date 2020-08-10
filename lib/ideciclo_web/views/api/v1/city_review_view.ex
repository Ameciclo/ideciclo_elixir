defmodule IdecicloWeb.Api.V1.CityReviewView do
  use IdecicloWeb, :view
  alias IdecicloWeb.Api.V1.CityReviewView

  def render("index.json", %{city_reviews: city_reviews}) do
    %{data: render_many(city_reviews, CityReviewView, "city_review.json")}
  end

  def render("show.json", %{city_review: city_review}) do
    %{data: render_one(city_review, CityReviewView, "city_review.json")}
  end

  def render("city_review.json", %{city_review: city_review}) do
    %{id: city_review.id,
      year: city_review.year,
      ideciclo_rating: city_review.ideciclo_rating}
  end
end
