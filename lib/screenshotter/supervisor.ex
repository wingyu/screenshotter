defmodule Screenshotter.Supervisor do
  use Supervisor

  @size Application.get_env(:screenshotter, :size)
  @max_overflow Application.get_env(:screenshotter, :max_overflow)

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    poolboy_config = [
      {:name, {:local, Screenshotter.pool_name}},
      {:worker_module, Screenshotter.Worker},
      {:size, @size},
      {:max_overflow, @max_overflow}
    ]

    children = [
      :poolboy.child_spec(Screenshotter.pool_name, poolboy_config, [])
    ]

    options = [
      strategy: :one_for_one
    ]

    supervise(children, options)
  end
end
