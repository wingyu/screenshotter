defmodule Screenshotter.Instructor do
  require Logger

  @moduledoc "Implements core functionality of Screenshotter"
  @fetcher Application.get_env(:screenshotter, :fetcher)
  @cleaner Application.get_env(:screenshotter, :cleaner)

  #Need to refractor this, the returned values from other methods don't feel clean/make sense
  @doc "Runs Screenshotter, which fetches screenshots then uploads it to S3"
  @spec run(String.t, String.t, String.t) :: atom
  def run(url, bucket, dir) do
    Logger.info "Initiating screenshot service for #{url}"

    @fetcher.run(url)
    |> Screenshotter.Uploader.run(bucket, dir)
    |> @cleaner.run
  end
end
