defmodule ATaleOfCoffeesWeb.PageLive do
  use ATaleOfCoffeesWeb, :live_view
  alias ATaleOfCoffees.Tastings

  @impl true
  def mount(_params, _session, socket) do
    Tastings.subscribe()
    brews = Tastings.list_brews()
    {:ok, assign(socket, brews: brews), temporary_assigns: [brews: []]}
  end

  @impl true
  def handle_info({:brew_created, brew} = _params, socket) do
    {:noreply, socket |> update(:brews, fn brews -> [brew | brews] end)}
  end

  @impl true
  def handle_info({:brew_updated, brew} = _params, socket) do
    {:noreply, socket |> update(:brews, fn brews -> [brew | brews] end)}
  end
end
