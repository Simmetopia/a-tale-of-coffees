defmodule ATaleOfCoffeesWeb.Tasting.Index do
  use ATaleOfCoffeesWeb, :live_component
  alias ATaleOfCoffees.Tastings

  @impl true
  def update(assigns, socket) do
    brew = %Tastings.Brew{}
    changeset = Tastings.change_brew(brew)

    {:ok,
     socket
     |> assign(changeset: changeset)
     |> assign(brew: brew)
     |> assign(assigns)}
  end

  @impl true
  def handle_event("validate", %{"brew" => brew_params}, socket) do
    changeset =
      socket.assigns.brew
      |> Tastings.change_brew(brew_params)
      |> Map.put(:action, :validate)

    {:noreply, socket |> assign(:changeset, changeset) |> put_flash(:info, "Validated")}
  end

  @impl true
  def handle_event("save", %{"brew" => brew_params}, socket) do
    case Tastings.create_brew(brew_params) do
      {:ok, _brew} ->
        {:noreply, socket |> put_flash(:info, "very success")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, socket |> assign(changeset: changeset)}
    end
  end
end
