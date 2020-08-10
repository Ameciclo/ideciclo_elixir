defmodule IdecicloWeb.Api.V1.CityReviewController do
  use IdecicloWeb, :controller

  alias Ideciclo.API

  action_fallback IdecicloWeb.FallbackController

  def index(conn, _params) do
    city_reviews = API.list_city_reviews()
    render(conn, "index.json", city_reviews: city_reviews)
  end

  def show(conn, %{"id" => id}) do
    city_review = API.get_city_review!(id)
    render(conn, "show.json", city_review: city_review)
  end
end
