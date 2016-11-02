# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hard_thing_rule,
  ecto_repos: [HardThingRule.Repo]

# Configures the endpoint
config :hard_thing_rule, HardThingRule.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4/PxWz/iyiQjxJ8Zmii0if/ffD59w+U4bg0WoDLWWntouUtSzdLZaCd2crm2GV7g",
  render_errors: [view: HardThingRule.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HardThingRule.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
