defmodule Screenshotter.ExAwsClient do
  @moduledoc "Wrapper for required ExAws methods"
  import ExAws, only: [request!: 1]
  import ExAws.S3, only: [put_object: 3]

  #I wanted to name this just request but this led to a clash
  #in method names (maybe don't import?)
  @doc "executes request to AWS's API"
  def make_request!(operation), do: request!(operation)

  @doc "Prepares request to put an object into a S3 bucket"
  def put_s3_object(bucket, path, file_data) do
    put_object(bucket, path, file_data)
  end
end
