defmodule Screenshotter do
  use Application

  @pool_name :worker_pool

  def pool_name, do: @pool_name

  def start(_type, _args) do
    Screenshotter.Supervisor.start_link
  end

  def sync_run(url) do
    :poolboy.transaction(
      @pool_name,
      fn(pid) -> :gen_server.call(pid, {:get_shot, url}) end,
      :infinity
    )
  end

  def async_run(url) do
    spawn( fn() -> sync_run(url) end )
  end

  def bulk_run(url_list) do
    tasks = Enum.map(url_list, fn(url) ->
      Task.async(fn -> sync_run(url) end)
    end)

    Enum.each(tasks, fn(task) -> IO.puts(Task.await(task, @timeout)) end)
  end
end
