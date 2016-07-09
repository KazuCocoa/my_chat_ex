defmodule MyChatEx.PageController do
  use MyChatEx.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
