defmodule IdecicloWeb.Api.V1.CityView do
  use IdecicloWeb, :view
  alias IdecicloWeb.Api.V1.CityView

  def render("index.json", %{cities: cities}) do
    render_many(cities, CityView, "city_without_review.json")
  end

  def render("show.json", %{city: city}) do
    render_one(city, CityView, "city.json")
  end

  def render("city_without_review.json", %{city: city}) do
    %{id: city.id,
      city: city.city,
      state: city.state
    }
  end

  def render("city.json", %{city: city}) do
    %{id: city.id,
      city: city.city,
      state: city.state,
      currentReview: city.currentReview,
      previousReview: city.previousReview,
      reviewCount: city.reviewCount,
      extension: city.extension
    }
  end
end
