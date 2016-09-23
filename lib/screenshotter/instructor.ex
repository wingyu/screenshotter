defmodule Screenshotter.Instructor do
  @fetcher Application.get_env(:screenshotter, :fetcher)
  @cleaner Application.get_env(:screenshotter, :cleaner)

  def run(url, bucket, dir) do
    @fetcher.run(url)
    |> Screenshotter.Uploader.run(bucket, dir)
    |> @cleaner.run
  end
end
