defmodule Screenshotter.Instructor do
  @uploader Application.get_env(:screenshotter, :uploader)

  def run(url, bucket, dir) do
    case Screenshotter.Fetcher.run(url) do
      {:ok, title} ->
        @uploader.run(title, bucket, dir)
        #delete file once made
      {:error, error} ->
        IO.puts "Error in fetching screenshot"
    end
  end
end
