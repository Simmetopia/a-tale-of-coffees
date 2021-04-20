defmodule ATaleOfCoffeesWeb.ArchiveLive do
  use ATaleOfCoffeesWeb, :live_view
  alias ATaleOfCoffees.Tastings

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket |> assign(brews: Tastings.list_all_brews())}
  end

  @impl true
  def render(assigns) do
    ~L"""
      <div>
        <%= live_component @socket, ATaleOfCoffeesWeb.Tasting.ListOfTastings, brews: @brews %>
      </div>
    """
  end
end
