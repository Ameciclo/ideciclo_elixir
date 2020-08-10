defmodule Ideciclo.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :city, :string
      add :state, :string
    end

  end
end
