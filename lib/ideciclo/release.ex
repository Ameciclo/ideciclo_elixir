defmodule Ideciclo.Release do
  @ideciclo :ideciclo

  require Logger

  def migrate do
    load_app()

    for repo <- repos() do
      {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
    end
  end

 @doc """
  Seed seeds file for repo.
  """
  @spec seed(Ecto.Repo.t(), String.t()) :: :ok | {:error, any()}
  def seed(repo, filename) do
    load_app()

    case Ecto.Migrator.with_repo(repo, &eval_seed(&1, filename)) do
      {:ok, {:ok, _fun_return}, _apps} ->
        :ok

      {:ok, {:error, reason}, _apps} ->
        Logger.error(reason)
        {:error, reason}

      {:error, term} ->
        IO.warn(term, [])
        {:error, term}
    end
  end

  @spec eval_seed(Ecto.Repo.t(), String.t()) :: any()
  defp eval_seed(repo, filename) do
    seeds_file = get_path(repo, "", filename)
    IO.puts(seeds_file)

    if File.regular?(seeds_file) do
      {:ok, Code.eval_file(seeds_file)}
    else
      {:error, "Seeds file not found."}
    end
  end

  @spec get_path(Ecto.Repo.t(), String.t(), String.t()) :: String.t()
  defp get_path(repo, directory, filename) do
    priv_dir = "#{:code.priv_dir(@ideciclo)}"

    repo_underscore =
      repo
      |> Module.split()
      |> List.last()
      |> Macro.underscore()

    Path.join([priv_dir, repo_underscore, directory, filename])
  end

  def rollback(repo, version) do
    load_app()
    {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version))
  end

  defp repos do
    Application.fetch_env!(@ideciclo, :ecto_repos)
  end

  defp load_app do
    Application.load(@ideciclo)
  end
end
