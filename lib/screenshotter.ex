defmodule Screenshotter do
  use Application

  @pool_name :worker_pool

  def pool_name, do: @pool_name

  def start(_type, _args) do
    Screenshotter.Supervisor.start_link
  end

  def sync_run(url, bucket, dir) do
    :poolboy.transaction(
      @pool_name,
      fn(pid) -> :gen_server.call(pid, {:get_shot, {url, bucket, dir}}) end,
      10000
    )
  end

  def async_run(url, bucket, dir) do
#spawn
    sync_run(url, bucket, dir)
  end

  def bulk_run do

#https://elixirschool.com/lessons/libraries/poolboy/
  end
end
