defmodule ATaleOfCoffees.Tastings do
  @moduledoc """
  The Tastings context.
  """

  import Ecto.Query, warn: false
  alias ATaleOfCoffees.Repo

  alias ATaleOfCoffees.Tastings.Brew

  @topic "brews"

  def subscribe do
    Phoenix.PubSub.subscribe(ATaleOfCoffees.PubSub, @topic)
  end

  defp broadcast({:error, _reason} = error, _event), do: error

  defp broadcast({:ok, brew}, event) do
    Phoenix.PubSub.broadcast(ATaleOfCoffees.PubSub, @topic, {event, brew})
    {:ok, brew}
  end

  @doc """
  Returns the list of brews.

  ## Examples

      iex> list_brews()
      [%Brew{}, ...]

  """
  def list_brews do
    Repo.all(
      from u in Brew, where: u.inserted_at > ago(2, "hour"), order_by: [desc: u.inserted_at]
    )
  end

  def list_all_brews do
    Repo.all(from b in Brew, order_by: [desc: b.inserted_at], limit: 50)
  end

  @doc """
  Gets a single brew.

  Raises `Ecto.NoResultsError` if the Brew does not exist.

  ## Examples

      iex> get_brew!(123)
      %Brew{}

      iex> get_brew!(456)
      ** (Ecto.NoResultsError)

  """
  def get_brew!(id), do: Repo.get!(Brew, id)

  @doc """
  Creates a brew.

  ## Examples

      iex> create_brew(%{field: value})
      {:ok, %Brew{}}

      iex> create_brew(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_brew(attrs \\ %{}) do
    %Brew{}
    |> Brew.changeset(attrs)
    |> Repo.insert()
    |> broadcast(:brew_created)
  end

  @doc """
  Updates a brew.

  ## Examples

      iex> update_brew(brew, %{field: new_value})
      {:ok, %Brew{}}

      iex> update_brew(brew, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_brew(%Brew{} = brew, attrs) do
    brew
    |> Brew.changeset(attrs)
    |> Repo.update()
  end

  def inc_likes(%Brew{id: id}) do
    {1, [brew]} =
      from(b in Brew, where: b.id == ^id, select: b) |> Repo.update_all(inc: [likes: 1])

    broadcast({:ok, brew}, :brew_updated)
  end

  @doc """
  Deletes a brew.

  ## Examples

      iex> delete_brew(brew)
      {:ok, %Brew{}}

      iex> delete_brew(brew)
      {:error, %Ecto.Changeset{}}

  """
  def delete_brew(%Brew{} = brew) do
    Repo.delete(brew)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking brew changes.

  ## Examples

      iex> change_brew(brew)
      %Ecto.Changeset{data: %Brew{}}

  """
  def change_brew(%Brew{} = brew, attrs \\ %{}) do
    Brew.changeset(brew, attrs)
  end
end
