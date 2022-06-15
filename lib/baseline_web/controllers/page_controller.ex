defmodule BaselineWeb.PageController do
  use BaselineWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
