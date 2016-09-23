defmodule Screenshotter.Cleaner do
  def run(path) do
    if File.exists?(path) do
      IO.puts "Removing #{path}"

      File.rm!(path)
    end
  end
end
