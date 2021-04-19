# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :a_tale_of_coffees,
  ecto_repos: [ATaleOfCoffees.Repo]

# Configures the endpoint
config :a_tale_of_coffees, ATaleOfCoffeesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ao/cC7JSGdG4vsdUY6sZyQzQ0rYWM6PhTKXsHoGC3671IqmplSbtQTHFg3wYEGo2",
  render_errors: [view: ATaleOfCoffeesWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ATaleOfCoffees.PubSub,
  live_view: [signing_salt: "lFKTwVuE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
