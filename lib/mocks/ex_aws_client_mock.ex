defmodule Screenshotter.ExAwsClientMock do
  alias ExAws.{Operation}

  def make_request!(_), do: :ok


  def put_s3_object(bucket, path, file_data) do
    %Operation.S3{
      body: "#{file_data}", bucket: bucket,
      headers: %{"content-encoding" => "application/json"},
      path: path,
      http_method: :put
    }
  end
end
