defmodule Screenshotter.Instructor do
  def run(url) do
    case Screenshotter.Fetcher.run(url) do
      {:ok, title} ->
        Screenshotter.Uploader.run(title, "s3-test-vwwong")
      {:error, error} ->
        IO.puts "Error in fetching screenshot"
    end
  end
end
