defmodule KV do
  use GenServer

  @vsn 0

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, %{}}
  end

  def get(key, default \\ nil) do
    GenServer.call(__MODULE__, {:get, key, default})
  end

  def put(key, value) do
    GenServer.call(__MODULE__, {:put, key, value})
  end

  def handle_call({:get, key, default}, _caller, state) do
    IO.puts "Getting key: #{key}"
    {:reply, Map.get(state, key, default), state}
  end

  def handle_call({:put, key, value}, _caller, state) do
    IO.puts "Setting key: #{key} to value #{value}"
    {:reply, :ok, Map.put(state, key, value)}
  end

end
