defmodule Screenshotter.Cleaner do
  require Logger

  @moduledoc "Implements basic cleanup functions"

  @doc "Removes a specified file if it exists"
  @spec run(String.t) :: atom
  def run(path) do
    if File.exists?(path) do
    Logger.info "Removing #{path} locally"

      File.rm!(path)
    end

    :ok
  end
end
