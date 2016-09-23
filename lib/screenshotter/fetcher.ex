defmodule Screenshotter.Fetcher do
  @screenshot_dir Application.get_env(:screenshotter, :screenshot_dir)
  use Hound.Helpers

  #needs PhantomJS running
  def run(base) do
    IO.puts "Fetching #{base}"

    Hound.start_session

    url = "http://" <> base
    timestamp = DateTime.utc_now
                |> DateTime.to_unix
                |> Integer.to_string

    title = "#{base}-#{timestamp}.png"

    navigate_to url

    take_screenshot("#{@screenshot_dir}/#{title}")

    # Automatically invoked if the session owner process crashes
    Hound.end_session

    title
  end
end
