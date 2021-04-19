defmodule ATaleOfCoffees.Tastings.Brew do
  use Ecto.Schema
  import Ecto.Changeset

  schema "brews" do
    field :created_by, :string
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(brew, attrs) do
    brew
    |> cast(attrs, [:title, :description, :created_by])
    |> validate_required([:title, :description, :created_by])
  end
end
