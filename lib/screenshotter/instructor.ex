defmodule Screenshotter.Instructor do
  @fetcher Application.get_env(:screenshotter, :fetcher)

  def run(url, bucket, dir) do
    case @fetcher.run(url) do
      {:ok, title} ->
        Screenshotter.Uploader.run(title, bucket, dir)
        #delete file once made
      error ->
        error
    end
  end
end
