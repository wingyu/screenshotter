defmodule Screenshotter.FetcherTest do
  use ExUnit.Case
  #import Screenshotter.Fetcher, only: [run: 2]

  #All tests will fetch an image
  @moduletag :fetch_image

  test "#run" do
    assert {:error, _} = Screenshotter.Fetcher.run(1)
    assert {:ok, title} = Screenshotter.Fetcher.run("example.com", "./test/screenshots")

    assert File.exists?("./test/screenshots/#{title}") == true
  end
end
