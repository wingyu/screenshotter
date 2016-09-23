defmodule Screenshotter.Instructor do
  @fetcher Application.get_env(:screenshotter, :fetcher)
  @cleaner Application.get_env(:screenshotter, :cleaner)

  def run(url, bucket, dir) do
    case @fetcher.run(url) do
      {:ok, title} ->
        case Screenshotter.Uploader.run(title, bucket, dir) do
          {:ok, screenshot_path} ->
            @cleaner.run(screenshot_path)
          error ->
            error
        end
      error ->
        error
    end
  end
end
