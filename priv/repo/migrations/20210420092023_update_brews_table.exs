defmodule ATaleOfCoffees.Repo.Migrations.UpdateBrewsTable do
  use Ecto.Migration

  def change do
    alter table(:brews) do
      add :likes, :integer
    end
  end
end
