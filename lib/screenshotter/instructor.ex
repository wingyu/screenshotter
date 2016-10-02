defmodule Screenshotter.Instructor do
  @fetcher Application.get_env(:screenshotter, :fetcher)
  @cleaner Application.get_env(:screenshotter, :cleaner)

  #Need to refractor this, the returned values from other methods don't feel clean/make sense
  def run(url, bucket, dir) do
    @fetcher.run(url)
    |> Screenshotter.Uploader.run(bucket, dir)
    |> @cleaner.run
  end
end
