defmodule Screenshotter.UploaderMock do
  def run(_title, "invalid-bucket", _dir), do: {:error, "invalid bucket"}
  def run(title, _bucket, _dir), do: {:ok, "Uploaded #{title}"}
end
