defmodule IdecicloWeb.Api.V1.ReviewController do
  use IdecicloWeb, :controller

  alias Ideciclo.API
  alias Ideciclo.API.Review

  action_fallback IdecicloWeb.FallbackController

  def index(conn, _params) do
    reviews = API.list_reviews()
    |> IO.inspect()
    render(conn, "index.json", reviews: reviews)
  end

  def create(conn, %{"review" => review_params}) do
    with {:ok, %Review{} = review} <- API.create_review(review_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.review_path(conn, :show, review))
      |> render("show.json", review: review)
    end
  end

  def show(conn, %{"id" => id}) do
    review = API.get_review!(id)
    render(conn, "show.json", review: review)
  end

  def update(conn, %{"id" => id, "review" => review_params}) do
    review = API.get_review!(id)

    with {:ok, %Review{} = review} <- API.update_review(review, review_params) do
      render(conn, "show.json", review: review)
    end
  end

  def delete(conn, %{"id" => id}) do
    review = API.get_review!(id)

    with {:ok, %Review{}} <- API.delete_review(review) do
      send_resp(conn, :no_content, "")
    end
  end
end
