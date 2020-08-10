defmodule IdecicloWeb.Api.V1.CityView do
  use IdecicloWeb, :view
  alias IdecicloWeb.Api.V1.CityView
  alias IdecicloWeb.Api.V1.CityReviewView

  def render("index.json", %{cities: cities}) do
    render_many(cities, CityView, "city.json")
  end

  def render("show.json", %{city: city}) do
    render_one(city, CityView, "city.json")
  end

  def render("city.json", %{city: city}) do
    %{id: city.id,
      city: city.city,
      state: city.state,
      reviews: render_many(city.reviews, CityReviewView, "city_review.json")}
  end
end
