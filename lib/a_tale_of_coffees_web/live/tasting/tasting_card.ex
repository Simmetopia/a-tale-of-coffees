defmodule ATaleOfCoffeesWeb.Tasting.TastingCard do
  use ATaleOfCoffeesWeb, :live_component

  @impl true
  def handle_event("inc_likes", _, socket) do
    brew = socket.assigns.brew
    ATaleOfCoffees.Tastings.inc_likes(brew)

    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <div class="bg-white p-3 shadow rounded grid grid-cols-1">
        <div class="flex flex-row gap-3">
            Brew:
            <%= @brew.title %>
        </div>
        <div class="flex flex-row gap-3">
            Enjoyment:
            <%= @brew.description %>
        </div>
        <div class="flex flex-row gap-3">
            <span>enjoyed by:</span>
            <%= @brew.created_by %> at
            <%= "#{zero_pad(@brew.inserted_at.hour)}:#{zero_pad(@brew.inserted_at.second)}" %>
        </div>
        <div class="flex flex-row justify-end">
          <a href="#" phx-click="inc_likes" phx-target="<%= @myself %>" >
            ❤️ (<%= @brew.likes %>)
          </a>
        </div<
    </div>
    """
  end

  defp zero_pad(number, amount \\ 2) do
    number
    |> Integer.to_string()
    |> String.pad_leading(amount, "0")
  end
end
