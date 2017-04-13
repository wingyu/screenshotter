defmodule Screenshotter.Worker do
  use GenServer

  ### API
  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok)
  end

  def get_shot(url, bucket, dir) do
    GenServer.call(__MODULE__, {:get_shot, {url, bucket, dir}})
  end

  ### CALLBACKS

  def handle_call({:get_shot, param_tuple}, _from, state) do
    case Screenshotter.Instructor.run(param_tuple) do
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
