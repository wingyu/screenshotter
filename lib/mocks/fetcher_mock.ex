defmodule Screenshotter.FetcherMock do
  def run(1), do: {:error, "invalid url"}
  def run(_base), do: {:ok, "random.png"}
end
