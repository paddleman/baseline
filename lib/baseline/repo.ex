defmodule Baseline.Repo do
  use Ecto.Repo,
    otp_app: :baseline,
    adapter: Ecto.Adapters.Postgres
end
