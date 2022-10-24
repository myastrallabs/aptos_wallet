defmodule AptosWalletWeb.PageLive do
  @moduledoc false

  use AptosWalletWeb, :live_view

  @impl true
  def mount(_, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  def apply_action(socket, :index, _params) do
    socket
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="page">
      <%= live_render(@socket, AptosWalletWeb.WalletLive, id: "wallet", session: %{"id" => "wallet-connect"}) %>
    </div>
    """
  end
end
