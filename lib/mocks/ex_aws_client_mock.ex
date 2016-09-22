defmodule Screenshotter.ExAwsClientMock do
  def make_request!("invalid"), do: raise "invalid operation"
  def make_request!(_), do: {:ok, %{body: {}}}


  def put_s3_object("invalid bucket", _path, _file_data), do: raise "invalid bucket"
  def put_s3_object(_bucket, _path, _file_data) do
    %{
      body: "data", bucket: "bucket",
      headers: %{"content-encoding" => "application/json"},
      path: "object.json",
      http_method: :put
    }
  end
end
