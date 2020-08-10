defmodule Ideciclo.Repo.Migrations.CreateStructures do
  use Ecto.Migration

  def change do
    create table(:structures) do
      add :street, :string
      add :max_speed, :integer
      add :extension, :float
      add :city_id, references(:cities, on_delete: :nothing)
      add :structure_type_id, references(:structure_types, on_delete: :nothing)

      timestamps()
    end

    create index(:structures, [:city_id])
    create index(:structures, [:structure_type_id])
  end
end
