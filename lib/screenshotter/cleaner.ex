defmodule Screenshotter.Cleaner do
  require Logger

  @moduledoc "Implements basic cleanup functions"

  @doc "Removes a specified file if it exists"
  @spec run(String.t) :: atom
  def run(path) do
    case File.exists?(path) do
      true ->
        Logger.info "Removing #{path} locally"

        File.rm!(path)
      false ->
        Logger.error "File not found"
    end

    :ok
  end
end
