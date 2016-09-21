defmodule Screenshotter.Instructor do
  @uploader Application.get_env(:screenshotter, :uploader)
  @fetcher Application.get_env(:screenshotter, :fetcher)

  def run(url, bucket, dir) do
    case @fetcher.run(url) do
      {:ok, title} ->
        @uploader.run(title, bucket, dir)
        #delete file once made
      error ->
        error
    end
  end
end
