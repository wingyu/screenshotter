defmodule Screenshotter do
  defp run(url, bucket, path) do
    Screenshotter.Instructor.run({url, bucket, path})
  end
end
