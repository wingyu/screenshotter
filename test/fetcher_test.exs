defmodule Screenshotter.FetcherTest do
  use ExUnit.Case, async: true
  import Screenshotter.Fetcher, only: [run: 1]
  @screenshot_dir Application.get_env(:screenshotter, :screenshot_dir)

  #All tests will fetch an image
  @moduletag :fetch_screenshot

  test "#run" do
    assert {:error, _} = run(1)
    assert {:ok, title} = run("example.com")

    assert File.exists?("#{@screenshot_dir}/#{title}") == true
  end
end
