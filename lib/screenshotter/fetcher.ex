defmodule Screenshotter.Fetcher do
  require Logger
  use Hound.Helpers

  @moduledoc "Implements basic functions to fectch screenshots"
  @screenshot_dir Application.get_env(:screenshotter, :screenshot_dir)

  #needs PhantomJS running
  @doc "Grabs and saves screenshots of specified websites"
  @spec run(String.t) :: String.t
  def run(base) do
    Logger.info "Fetching screenshot #{base}"

    Hound.start_session

    url = "http://" <> base
    timestamp = generate_timestamp
    title = "#{base}-#{timestamp}.png"

    navigate_to url

    take_screenshot("#{@screenshot_dir}/#{title}")

    # Automatically invoked if the session owner process crashes
    Hound.end_session

    Logger.info "Screenshot from #{url} received!"

    {:ok, title}
  rescue
    e -> {:error, e}
  end


  defp generate_timestamp do
    DateTime.utc_now
    |> DateTime.to_unix
    |> Integer.to_string
  end
end
