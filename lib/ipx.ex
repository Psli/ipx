defmodule Ipx do
  @moduledoc """
  Documentation for `Ipx`.
  """
  use GenServer

	alias Ipx.ChinaIPs

	def start_link(opts \\ []) do
    state = opts |> Keyword.get(:source) |> ChinaIPs.load()
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  ## Server Callbacks

  def init(state) do
    {:ok, state}
  end

  def handle_call({:is_from_china, ip}, _from, state) do
    {:reply, ChinaIPs.is_from_china(ip, state), state}
  end

  def handle_cast(_, state) do
    {:noreply, state}
  end

  def is_from_china(ip) do
		GenServer.call(__MODULE__, {:is_from_china, ip})
	end

end
