defmodule BattlinBots.Game do
  use GenServer

  @tick_rate 100

  # Client

  def start_link(default) do
    IO.puts("start game gen server")
    GenServer.start_link(__MODULE__, 0)
  end

  def current_tick(pid) do
    GenServer.call(pid, :current_tick)
  end

  # Server
  
  def init(state) do
    IO.puts("init")
    Process.send_after(self, :tick, @tick_rate)
    {:ok, state}
  end

  def handle_info(:tick, state) do
    time = state + 1
    IO.puts("ticking #{time}")
    Process.send_after(self, :tick, @tick_rate)
    {:noreply, time}
  end

  def handle_call(:current_tick, _from, state) do
    {:reply, state, state}
  end
end
