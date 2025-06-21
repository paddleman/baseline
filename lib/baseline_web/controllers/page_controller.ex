defmodule BaselineWeb.PageController do
  use BaselineWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
