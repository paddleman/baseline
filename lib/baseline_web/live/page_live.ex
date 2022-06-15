defmodule BaselineWeb.PageLive do
  use BaselineWeb, :live_view

  alias Baseline.Accounts
  alias Baseline.Accounts.User

  @impl true
  def mount(_params, _session, socket) do
    changeset = Accounts.change_user_registration(%User{})
    {:ok,
      socket
      |> assign(changeset: changeset)
      |> assign(trigger_submit: false)}
  end



end
