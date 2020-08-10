defmodule Ideciclo.API do
  @moduledoc """
  The API context.
  """

  import Ecto.Query, warn: false
  alias Ideciclo.Repo

  alias Ideciclo.API.City

  @doc """
  Returns the list of cities.

  ## Examples

      iex> list_cities()
      [%City{}, ...]

  """
  def list_cities do
    City
    |> Repo.all()
    |> Repo.preload(:reviews)
  end

  @doc """
  Gets a single city.

  Raises `Ecto.NoResultsError` if the City does not exist.

  ## Examples

      iex> get_city!(123)
      %City{}

      iex> get_city!(456)
      ** (Ecto.NoResultsError)

  """
  def get_city!(id) do
    Repo.get!(City, id)
    |> Repo.preload(:reviews)
  end

  def get_city_by_name!(name) do
    Repo.get_by!(City, city: name)
    |> Repo.preload(:reviews)
  end

  @doc """
  Creates a city.

  ## Examples

      iex> create_city(%{field: value})
      {:ok, %City{}}

      iex> create_city(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_city(attrs) do
    %City{}
    |> City.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a city.

  ## Examples

      iex> update_city(city, %{field: new_value})
      {:ok, %City{}}

      iex> update_city(city, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_city(%City{} = city, attrs) do
    city
    |> City.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a city.

  ## Examples

      iex> delete_city(city)
      {:ok, %City{}}

      iex> delete_city(city)
      {:error, %Ecto.Changeset{}}

  """
  def delete_city(%City{} = city) do
    Repo.delete(city)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking city changes.

  ## Examples

      iex> change_city(city)
      %Ecto.Changeset{data: %City{}}

  """
  def change_city(%City{} = city, attrs \\ %{}) do
    City.changeset(city, attrs)
  end

  alias Ideciclo.API.CityReview

  @doc """
  Returns the list of city_reviews.

  ## Examples

      iex> list_city_reviews()
      [%CityReview{}, ...]

  """
  def list_city_reviews do
    CityReview
    |> Repo.all()
  end

  @doc """
  Gets a single city_review.

  Raises `Ecto.NoResultsError` if the City review does not exist.

  ## Examples

      i
      %CityReview{}

      iex> get_city_review!(456)
      ** (Ecto.NoResultsError)

  """
  def get_city_review!(id) do
    Repo.get!(CityReview, id)
  end

  @doc """
  Creates a city_review.

  ## Examples

      iex> create_city_review(%{field: value})
      {:ok, %CityReview{}}

      iex> create_city_review(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_city_review(attrs \\ %{}) do
  %CityReview{}
    |> CityReview.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a city_review.

  ## Examples

      iex> update_city_review(city_review, %{field: new_value})
      {:ok, %CityReview{}}

      iex> update_city_review(city_review, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_city_review(%CityReview{} = city_review, attrs) do
    city_review
    |> CityReview.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a city_review.

  ## Examples

      iex> delete_city_review(city_review)
      {:ok, %CityReview{}}

      iex> delete_city_review(city_review)
      {:error, %Ecto.Changeset{}}

  """
  def delete_city_review(%CityReview{} = city_review) do
    Repo.delete(city_review)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking city_review changes.

  ## Examples

      iex> change_city_review(city_review)
      %Ecto.Changeset{data: %CityReview{}}

  """
  def change_city_review(%CityReview{} = city_review, attrs \\ %{}) do
    CityReview.changeset(city_review, attrs)
  end

  alias Ideciclo.API.StructureType

  @doc """
  Returns the list of structure_types.

  ## Examples

      iex> list_structure_types()
      [%StructureType{}, ...]

  """
  def list_structure_types do
    Repo.all(StructureType)
  end

  @doc """
  Gets a single structure_type.

  Raises `Ecto.NoResultsError` if the Structure type does not exist.

  ## Examples

      iex> get_structure_type!(123)
      %StructureType{}

      iex> get_structure_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_structure_type!(id), do: Repo.get!(StructureType, id)

  @doc """
  Creates a structure_type.

  ## Examples

      iex> create_structure_type(%{field: value})
      {:ok, %StructureType{}}

      iex> create_structure_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_structure_type(attrs \\ %{}) do
    %StructureType{}
    |> StructureType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a structure_type.

  ## Examples

      iex> update_structure_type(structure_type, %{field: new_value})
      {:ok, %StructureType{}}

      iex> update_structure_type(structure_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_structure_type(%StructureType{} = structure_type, attrs) do
    structure_type
    |> StructureType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a structure_type.

  ## Examples

      iex> delete_structure_type(structure_type)
      {:ok, %StructureType{}}

      iex> delete_structure_type(structure_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_structure_type(%StructureType{} = structure_type) do
    Repo.delete(structure_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking structure_type changes.

  ## Examples

      iex> change_structure_type(structure_type)
      %Ecto.Changeset{data: %StructureType{}}

  """
  def change_structure_type(%StructureType{} = structure_type, attrs \\ %{}) do
    StructureType.changeset(structure_type, attrs)
  end

  alias Ideciclo.API.Structure

  @doc """
  Returns the list of structures.

  ## Examples

      iex> list_structures()
      [%Structure{}, ...]

  """
  def list_structures do
    Structure
    |> Repo.all()
    |> Repo.preload(:structure_type)
    |> Repo.preload(:city)
  end

  @doc """
  Gets a single structure.

  Raises `Ecto.NoResultsError` if the Structure does not exist.

  ## Examples

      iex> get_structure!(123)
      %Structure{}

      iex> get_structure!(456)
      ** (Ecto.NoResultsError)

  """
  def get_structure!(id), do: Repo.get!(Structure, id)

  @doc """
  Creates a structure.

  ## Examples

      iex> create_structure(%{field: value})
      {:ok, %Structure{}}

      iex> create_structure(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_structure(attrs \\ %{}) do
    %Structure{}
    |> Structure.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a structure.

  ## Examples

      iex> update_structure(structure, %{field: new_value})
      {:ok, %Structure{}}

      iex> update_structure(structure, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_structure(%Structure{} = structure, attrs) do
    structure
    |> Structure.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a structure.

  ## Examples

      iex> delete_structure(structure)
      {:ok, %Structure{}}

      iex> delete_structure(structure)
      {:error, %Ecto.Changeset{}}

  """
  def delete_structure(%Structure{} = structure) do
    Repo.delete(structure)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking structure changes.

  ## Examples

      iex> change_structure(structure)
      %Ecto.Changeset{data: %Structure{}}

  """
  def change_structure(%Structure{} = structure, attrs \\ %{}) do
    Structure.changeset(structure, attrs)
  end

  alias Ideciclo.API.Review

  @doc """
  Returns the list of reviews.

  ## Examples

      iex> list_reviews()
      [%Review{}, ...]

  """
  def list_reviews do
    Review
    |> Repo.all()
    |> Repo.preload(:structure)
  end

  @doc """
  Gets a single review.

  Raises `Ecto.NoResultsError` if the Review does not exist.

  ## Examples

      iex> get_review!(123)
      %Review{}

      iex> get_review!(456)
      ** (Ecto.NoResultsError)

  """
  def get_review!(id), do: Repo.get!(Review, id)

  @doc """
  Creates a review.

  ## Examples

      iex> create_review(%{field: value})
      {:ok, %Review{}}

      iex> create_review(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_review(attrs \\ %{}) do
    %Review{}
    |> Review.changeset(attrs)
    |> Repo.insert()

  end

  @doc """
  Updates a review.

  ## Examples

      iex> update_review(review, %{field: new_value})
      {:ok, %Review{}}

      iex> update_review(review, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_review(%Review{} = review, attrs) do
    review
    |> Review.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a review.

  ## Examples

      iex> delete_review(review)
      {:ok, %Review{}}

      iex> delete_review(review)
      {:error, %Ecto.Changeset{}}

  """
  def delete_review(%Review{} = review) do
    Repo.delete(review)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking review changes.

  ## Examples

      iex> change_review(review)
      %Ecto.Changeset{data: %Review{}}

  """
  def change_review(%Review{} = review, attrs \\ %{}) do
    Review.changeset(review, attrs)
  end
end
