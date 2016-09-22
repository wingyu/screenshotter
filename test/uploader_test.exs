defmodule Screenshotter.UploaderTest do
  use ExUnit.Case
  import Screenshotter.Uploader, only: [run: 4]

  test "#run" do
    #Change this to bucket to a config var/ different bucket
    assert {:error, _} = \
      run("test.png", "invalid bucket", "uploads", "./test/screenshots")

    assert {:ok, _} = \
      run("test.png", "s3-test-vwwong", "uploads", "./test/screenshots")
  end
end
