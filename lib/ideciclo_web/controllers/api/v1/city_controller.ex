defmodule IdecicloWeb.Api.V1.CityController do
  use IdecicloWeb, :controller

  alias Ideciclo.API

  action_fallback IdecicloWeb.FallbackController

  def index(conn, _params) do
    cities = API.list_cities()
    render(conn, "index.json", cities: cities)
  end

  def show(conn, %{"city" => city}) do
    city = API.get_city_by_name!(city)
    render(conn, "show.json", city: city)
  end

end
