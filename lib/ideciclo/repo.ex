defmodule Ideciclo.Repo do
  use Ecto.Repo,
    otp_app: :ideciclo,
    adapter: Ecto.Adapters.Postgres
end
