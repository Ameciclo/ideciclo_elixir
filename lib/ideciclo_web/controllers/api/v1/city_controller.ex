defmodule IdecicloWeb.Api.V1.CityController do
  use IdecicloWeb, :controller

  alias Ideciclo.API

  action_fallback IdecicloWeb.FallbackController

  def index(conn, _params) do
    cities = API.list_cities()
    render(conn, "index.json", cities: cities)
  end

  def show(conn, %{"id" => id}) do
    city = API.get_city!(id)
    render(conn, "show.json", city: city)
  end

end
