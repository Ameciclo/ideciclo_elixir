defmodule Ideciclo.Repo.Migrations.CreateStructureTypes do
  use Ecto.Migration

  def change do
    create table(:structure_types) do
      add :name, :string
      add :typology, :string
    end

  end
end
