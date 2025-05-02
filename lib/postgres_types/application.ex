defmodule PostgresTypes.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PostgresTypesWeb.Telemetry,
      PostgresTypes.Repo,
      {DNSCluster, query: Application.get_env(:postgres_types, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PostgresTypes.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PostgresTypes.Finch},
      # Start a worker by calling: PostgresTypes.Worker.start_link(arg)
      # {PostgresTypes.Worker, arg},
      # Start to serve requests, typically the last entry
      PostgresTypesWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PostgresTypes.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PostgresTypesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
