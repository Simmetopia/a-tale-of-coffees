defmodule ATaleOfCoffees.Repo do
  use Ecto.Repo,
    otp_app: :a_tale_of_coffees,
    adapter: Ecto.Adapters.Postgres
end
