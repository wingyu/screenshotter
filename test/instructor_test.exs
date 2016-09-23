defmodule Screenshotter.InstructorTest do
  use ExUnit.Case, async: true
  import Screenshotter.Instructor, only: [run: 3]

  test "#run" do
    assert run("test.com", "my-bucket", "uploads")  == \
      {:ok, "Uploaded test.com.png"}

    assert run(1, "my-bucket", "uploads")  == \
      {:error, "invalid url"}

    assert run("random.com", "invalid bucket", "uploads")  == \
      {:error, %RuntimeError{message: "invalid bucket"}}
  end
end
