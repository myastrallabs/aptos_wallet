defmodule AptosWalletWeb.PageController do
  use AptosWalletWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
