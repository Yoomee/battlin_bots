defmodule BattlinBots.GameChannel do
  use Phoenix.Channel

  def join("games:new", _message, socket) do
    {:ok, game_pid} = BattlinBots.Game.start_link([])
    socket = assign(socket, :game, game_pid)
    {:ok, socket}
  end

  def handle_in("get_game_tick", _payload, socket) do
    tick = BattlinBots.Game.current_tick(socket.assigns[:game])
    broadcast! socket, "game_tick", %{"tick" => tick}
    {:noreply, socket}
  end
end
