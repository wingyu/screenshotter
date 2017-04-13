defmodule Screenshotter do
  def run(url, bucket, path) do
    Screenshotter.Instructor.run({url, bucket, path})
  end
end
