defmodule Screenshotter.Instructor do
  def run(url, bucket, dir) do
    case Screenshotter.Fetcher.run(url) do
      {:ok, title} ->
        Screenshotter.Uploader.run(title, bucket, dir)
      {:error, error} ->
        IO.puts "Error in fetching screenshot"
    end
  end
end
