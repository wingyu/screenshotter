defmodule Screenshotter.InstructorTest do
  use ExUnit.Case, async: true
  import Screenshotter.Instructor, only: [run: 1]

  test "#run" do
    assert run({"test.com", "my-bucket", "uploads"})  == :ok
  end
end
