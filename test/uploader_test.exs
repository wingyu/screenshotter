defmodule Screenshotter.UploaderTest do
  use ExUnit.Case
  import Screenshotter.Uploader, only: [run: 3]

  test "#run" do
    #Change this to bucket to a config var/ different bucket
    assert {:error, _} = \
      run("test.com.png", "invalid bucket", "uploads")

    assert {:ok, _} = \
      run("test.com.png", "s3-test-vwwong", "uploads")
  end
end
