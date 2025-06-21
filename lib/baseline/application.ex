defmodule Baseline.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BaselineWeb.Telemetry,
      Baseline.Repo,
      {DNSCluster, query: Application.get_env(:baseline, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Baseline.PubSub},
      # Start a worker by calling: Baseline.Worker.start_link(arg)
      # {Baseline.Worker, arg},
      # Start to serve requests, typically the last entry
      BaselineWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Baseline.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BaselineWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
