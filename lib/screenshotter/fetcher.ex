defmodule Screenshotter.Fetcher do
  use Hound.Helpers

  #needs PhantomJS running
  def run(base \\ "www.google.com")do
    Hound.start_session

    url = "http://" <> base
    timestamp = DateTime.utc_now
                |> DateTime.to_unix
                |> Integer.to_string

    title = "#{base}-#{timestamp}.png"

    navigate_to url

    take_screenshot("./screenshots/#{title}")

    # Automatically invoked if the session owner process crashes
    Hound.end_session

    {:ok, title}
  catch
    :exit, error -> {:error, error}
  end
end
