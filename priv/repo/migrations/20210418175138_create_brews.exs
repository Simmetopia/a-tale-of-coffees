defmodule ATaleOfCoffees.Repo.Migrations.CreateBrews do
  use Ecto.Migration

  def change do
    create table(:brews) do
      add :title, :string
      add :description, :string
      add :created_by, :string

      timestamps()
    end

  end
end
