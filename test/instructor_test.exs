defmodule Screenshotter.InstructorTest do
  use ExUnit.Case, async: true
  import Screenshotter.Instructor, only: [run: 3]

  test "#run" do
    assert run("random.com", "my-bucket", "uploads")  == \
      {:ok, "Uploaded random.png"}

    assert run("invalid-url", "my-bucket", "uploads")  == \
      {:error, "invalid url"}

    assert run("random.com", "invalid-bucket", "uploads")  == \
      {:error, "invalid bucket"}
  end
end
