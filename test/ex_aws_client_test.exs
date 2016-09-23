defmodule Screenshotter.ExAwsClientTest do
  use ExUnit.Case, async: true
  alias ExAws.{S3, Operation}
  import Screenshotter.ExAwsClient, only: [
    make_request!: 1,
    put_s3_object: 3
  ]

  #Tests may try to hit the AWS API
  @moduletag :aws_api

  test "#put_s3_object" do
    expected = %Operation.S3{
      body: "data", bucket: "bucket",
      path: "object.json",
      http_method: :put
    }

    assert expected == put_s3_object("bucket", "object.json", "data")
  end

  #Use list_buckets to make a non-destructive/creative request to AWS
  test "#make_request!" do
    assert %{body: body} = S3.list_buckets |> make_request!
    assert body |> String.contains?("ListAllMyBucketsResult")
  end
end
