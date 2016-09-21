defmodule Screenshotter.FetcherMock do
  def run("invalid-url"), do: {:error, "invalid url"}
  def run(_base), do: {:ok, "random.png"}
end
