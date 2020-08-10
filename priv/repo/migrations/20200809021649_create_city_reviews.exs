defmodule Ideciclo.Repo.Migrations.CreateCityReviews do
  use Ecto.Migration

  def change do
    create table(:city_reviews) do
      add :city_id, references(:cities)
      add :year, :integer
      add :ideciclo_rating, :float

      timestamps()
    end

  end
end
