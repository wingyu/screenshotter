defmodule Screenshotter.UploaderTest do
  use ExUnit.Case
  import Screenshotter.Uploader, only: [run: 4]

  #All tests will try upload an image
  @moduletag :upload_image

  test "#run" do
    #Change this to bucket to a config var/ different bucket
    assert {:error, _} = \
      run("test", "s3-test-vwwong", "uploads", "./test/screenshots")

    assert {:ok, _} = \
      run("test.png", "s3-test-vwwong", "uploads", "./test/screenshots")

    #Create an image to upload
    #File.open!("./tests/screenshot/groober.png")

    #Upload file to S3
    assert {:ok, _} = \
      ExAws.S3.get_object("s3-test-vwwong", "uploads/test.png") |> ExAws.request

    #Check that it is uploaded ... what if the image was already there?
    assert {:ok, _} = \
      ExAws.S3.get_object("s3-test-vwwong", "uploads/test.png") |> ExAws.request

    #Ensure it is removed
    assert {:ok, _} = \
      ExAws.S3.delete_object("s3-test-vwwong", "uploads/test.png") |> ExAws.request
  end
end
