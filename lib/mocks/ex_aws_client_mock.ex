defmodule Screenshotter.ExAwsClientMock do
  alias ExAws.{Operation}

  def make_request!(
    %Operation.S3{
      body: _, bucket: "invalid bucket",
      headers: %{"content-encoding" => "application/json"},
      path: _,
      http_method: :put
    }
  ), do: raise "invalid operation"
  def make_request!(_), do: {:ok, %{body: {}}}


  def put_s3_object(bucket, path, file_data) do
    %Operation.S3{
      body: "#{file_data}", bucket: bucket,
      headers: %{"content-encoding" => "application/json"},
      path: path,
      http_method: :put
    }
  end
end
