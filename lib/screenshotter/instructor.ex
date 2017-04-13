defmodule Screenshotter.Instructor do
  require Logger

  @moduledoc "Implements core functionality of Screenshotter"

  @fetcher Application.get_env(:screenshotter, :fetcher)
  @cleaner Application.get_env(:screenshotter, :cleaner)

  @doc "Runs Screenshotter, which fetches screenshots then uploads it to S3"
  @spec run(String.t) :: atom
  def run(url) do
    Logger.info "Initiating screenshot service for #{url}"

    @fetcher.run(url)
    |> decode_response
    |> Screenshotter.Uploader.run
    |> decode_response
    |> @cleaner.run
  end

  #Abstract this out into its own module?
  defp decode_response({:ok, body}), do: body
  defp decode_response({:error, body, error}) do
    Logger.error body
    raise error
  end
end
