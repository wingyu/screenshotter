defmodule Screenshotter.FetcherMock do
  def run(_base), do: {:ok, "test.com.png"}
end
