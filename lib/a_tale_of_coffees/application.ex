defmodule ATaleOfCoffees.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ATaleOfCoffees.Repo,
      # Start the Telemetry supervisor
      ATaleOfCoffeesWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ATaleOfCoffees.PubSub},
      # Start the Endpoint (http/https)
      ATaleOfCoffeesWeb.Endpoint
      # Start a worker by calling: ATaleOfCoffees.Worker.start_link(arg)
      # {ATaleOfCoffees.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ATaleOfCoffees.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ATaleOfCoffeesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
