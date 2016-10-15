defmodule Screenshotter.Cleaner do
  @moduledoc "Implements basic cleanup functions"

  @doc "Removes a specified file"
  def run(path) do
    if File.exists?(path) do
      IO.puts "Removing #{path}"

      File.rm!(path)
    end
  end
end
