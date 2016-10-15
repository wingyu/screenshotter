defmodule Screenshotter.Cleaner do
  @moduledoc "Implements basic cleanup functions"

  @doc "Removes a specified file if it exists"
  @spec run(String.t) :: atom
  def run(path) do
    if File.exists?(path) do
      IO.puts "Removing #{path}"

      File.rm!(path)
    end

    :ok
  end
end
