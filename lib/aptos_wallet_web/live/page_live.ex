defmodule AptosWalletWeb.PageLive do
  @moduledoc false

  use AptosWalletWeb, :live_view

  @impl true
  def mount(_, _session, socket) do
    {:ok,
     socket
     |> assign_new(:connected, fn -> false end)
     |> assign_new(:current_wallet_address, fn -> nil end)
     |> assign_new(:wallet_type, fn -> nil end)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  def apply_action(socket, :index, _params) do
    socket
  end

  # @impl true
  # def handle_event("transfer", _attrs, socket) do
  #   # NOTICE
  #   # change to_address && amount here.

  #   payload = %{
  #     to: "0xedc2501337f1c687fc2788033ddd847490b423f11dc75938cdfc696ab3deb909",
  #     amount: "100000000"
  #   }

  #   {:noreply, push_event(socket, "transfer", payload)}
  # end

  @impl true
  def handle_event("wallet-info", %{"address" => address, "walletType" => wallet_type}, socket) do
    connected = if address, do: true, else: false

    {:noreply,
     socket
     |> assign(:current_wallet_address, address)
     |> assign(:connected, connected)
     |> assign(:wallet_type, wallet_type)}
  end

  @impl true
  def handle_event("connect-petra", _, socket) do
    {:noreply, push_event(socket, "connect-petra", %{})}
  end

  @impl true
  def handle_event("connect-martian", _, socket) do
    {:noreply, push_event(socket, "connect-martian", %{})}
  end

  @impl true
  def handle_event("connect-starmask", _, socket) do
    {:noreply, push_event(socket, "connect-starmask", %{})}
  end

  @impl true
  def handle_event("disconnect", _, socket) do
    {:noreply, push_event(socket, "disconnect", %{})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="page" phx-hook="Wallet">
      <div>
        <div>
          current wallet status: <%= @connected %>
          <%= if @connected do %>
            <button phx-click="disconnect">Disconnect</button>
          <% end %>
        </div>
        <div> current wallet address: <%= @current_wallet_address %> </div>
        <div> current wallet type: <%= @wallet_type %> </div>
      </div>

      <button phx-click="connect-petra">Connect Petra</button>
      <button phx-click="connect-martian">Connect Martian</button>
      <button phx-click="connect-starmask">Connect Starmask</button>
    </div>
    """
  end
end
