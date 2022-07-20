defmodule FrontmatterWeb.PageController do
  use FrontmatterWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
