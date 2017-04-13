defmodule Screenshotter.Worker do
  use GenServer

  ### API
  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok)
  end

  def get_shot(url) do
    GenServer.call(__MODULE__, {:get_shot, url}, :infinity)
  end

  ### CALLBACKS

  def handle_call({:get_shot, url}, _from, state) do
    case Screenshotter.Instructor.run(url) do
      :ok ->
        {:reply, :ok, state}
      _ ->
        {:reply, :error, state}
    end
  end

  def init(state) do
    {:ok, state}
  end
end
