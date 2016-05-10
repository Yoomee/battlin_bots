defmodule BattlinBots.PageController do
  use BattlinBots.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
