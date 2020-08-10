defmodule Ideciclo.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :reviewed_at, :date
      add :reviewer, :string
      add :average_rating, :float
      add :safety_rating, :float
      add :comfort_rating, :float
      add :adequacy_rating, :float
      add :protection_rating, :float
      add :speed_control_rating, :float
      add :hor_cross_sign_rating, :float
      add :avg_structure_width, :float
      add :hor_sign_rating, :float
      add :ver_sign_rating, :float
      add :ver_cross_sign_rating, :float
      add :pattern_paint_rating, :float
      add :hor_sign_condition_rating, :float
      add :risk_rating, :float
      add :sinuosity_rating, :float
      add :bidirectionality_rating, :float
      add :shading_rating, :float
      add :type_pavement_rating, :float
      add :pavement_condition_rating, :float
      add :obstacles_rating, :float
      add :structure_id, references(:structures, on_delete: :nothing)

      timestamps()
    end

    create index(:reviews, [:structure_id])
  end
end
