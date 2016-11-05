defmodule Screenshotter.UploaderTest do
  use ExUnit.Case
  import Screenshotter.Uploader, only: [run: 3]

  test "#run" do
    #Change this to bucket to a config var/ different bucket
    run("test.com.png", "s3-test-vwwong", "/uploads") == \
      {:ok, "./test/screenshots/test.com.png"}
  end
end
