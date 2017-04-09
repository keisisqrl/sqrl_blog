# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sqrl_blog,
  ecto_repos: [SqrlBlog.Repo]

# Dev/Test admin user
config :sqrl_blog, :admin_user,
  name: "Admin User",
  email: "admin@example.com",
  password: "opensesame"

# Configures the endpoint
config :sqrl_blog, SqrlBlog.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZLBPOOBiVJ6vdKaZ6pTUND8TuaBbe5z0lEwJADnjaAbBC6rveGxvS72s8zdRa9+P",
  render_errors: [view: SqrlBlog.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SqrlBlog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: SqrlBlog.User,
  repo: SqrlBlog.Repo,
  module: SqrlBlog,
  logged_out_url: "/",
  opts: [:trackable, :authenticatable]
# %% End Coherence Configuration %%
