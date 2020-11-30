# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Ideciclo.Repo.insert!(%Ideciclo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Ideciclo.Repo
alias Ideciclo.API.City
alias Ideciclo.API.StructureType
alias Ideciclo.API.Structure

cities = [
  %{city: "Recife", state: "PE"},
  %{city: "Cabo de Santo Agostinho", state: "PE"},
  %{city: "Ipojuca", state: "PE"},
  %{city: "Jaboatão dos Guararapes", state: "PE"},
  %{city: "Olinda", state: "PE"},
  %{city: "Paulista", state: "PE"},
  %{city: "São Lourenço da Mata", state: "PE"},
  %{state: "DF", city: "Brasília"},
  %{city: "Belo Horizonte", state: "MG"},
  %{city: "São Paulo", state: "SP"}
]

Enum.each(
  cities,
  fn city ->
    Ideciclo.API.create_city(city)
  end
)

cityReviews_file = "#{__DIR__}/seeds/cityReviews.json"

with {:ok, body} <- File.read(cityReviews_file),
     {:ok, cityReviews} <- Jason.decode(body, keys: :atoms) do
  Enum.each(
    cityReviews,
    fn cityReview ->
      city = Repo.get_by!(City, city: cityReview.city)

      cityReview
      |> Map.put(:city, city)
      |> Ideciclo.API.create_city_review()
    end
  )
else
  err ->
    IO.inspect(err)
end

structureTypes = [
  %{name: "Ciclofaixa", typology: "Unidirecional"},
  %{name: "Ciclofaixa", typology: "Bidirecional"},
  %{name: "Ciclovia", typology: "Unidirecional"},
  %{name: "Ciclovia", typology: "Bidirecional"},
  %{name: "Ciclorrota", typology: "Unidirecional"},
  %{name: "Ciclorrota", typology: "Bidirecional"},
  %{name: "Calçada Compartilhada", typology: "Unidirecional"},
  %{name: "Calçada Compartilhada", typology: "Bidirecional"}
]

Enum.each(structureTypes, fn structureType ->
  Ideciclo.API.create_structure_type(structureType)
end)

structures_file = "#{__DIR__}/seeds/structures.json"

with {:ok, body} <- File.read(structures_file),
     {:ok, structures} <- Jason.decode(body, keys: :atoms) do
  Enum.each(
    structures,
    fn structure ->
      city = Repo.get_by!(City, city: structure.city)

      structure_type =
        Repo.get_by!(StructureType, name: structure.type, typology: structure.typology)

      structure
      |> Map.put(:city_id, city.id)
      |> Map.put(:structure_type_id, structure_type.id)
      |> Ideciclo.API.create_structure()
    end
  )
else
  err ->
    IO.inspect(err)
end

reviews_file = "#{__DIR__}/seeds/reviews.json"

with {:ok, body} <- File.read(reviews_file),
     {:ok, reviews} <- Jason.decode(body, keys: :atoms) do
  Enum.each(
    reviews,
    fn review ->
      structure = Repo.get_by!(Structure, street: review.street)
      review

      date =
        String.split(review.reviewed_at, "/")
        |> Enum.reverse()
        |> Enum.join("-")
        |> Date.from_iso8601!()

      Map.put(review, :reviewed_at, date)
      |> Map.put(:structure_id, structure.id)
      |> Ideciclo.API.create_review()
    end
  )
else
  err ->
    IO.inspect(err)
end

Repo.all(Structure)
|> Repo.preload(:reviews)
|> Enum.each(fn structure ->
  if Enum.count(structure.reviews) > 0 do
    average_rating =
      Enum.reduce(structure.reviews, 0, fn r, acc -> r.average_rating + acc end) /
        Enum.count(structure.reviews)

    Ideciclo.API.update_structure(structure, %{average_rating: average_rating})
  end
end)
