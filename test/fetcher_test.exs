defmodule Screenshotter.FetcherTest do
  use ExUnit.Case, async: true
  import Screenshotter.Fetcher, only: [run: 1]
  @screenshot_dir Application.get_env(:screenshotter, :screenshot_dir)
  @cleaner Application.get_env(:screenshotter, :cleaner)

  #All tests will fetch an image
  @moduletag :fetch_screenshot

  test "#run" do
    {:ok, title} = run("example.com")
    screenshot_path = "#{@screenshot_dir}/#{title}"

    assert File.exists?(screenshot_path) == true
    assert String.contains?(title, "example.com")== true

    #Remove screenshot generated in this test
    File.rm!(screenshot_path)
  end
end
