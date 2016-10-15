defmodule Screenshotter.Uploader do
  require Logger

  @moduledoc "Implements functions to upload files"

  @ex_aws_client Application.get_env(:screenshotter, :ex_aws_client)
  #Would this be better off as a simple boolean? eg. @use_test_dir?
  @screenshot_dir Application.get_env(:screenshotter, :screenshot_dir)

  @doc "Uploads a file to a specified S3 bucket"
  @spec run(String.t, String.t, String.t) :: String.t
  def run(title, bucket, bucket_dir) do
    Logger.info "Uploading #{title} to S3"

    upload(title, bucket, bucket_dir)

    Logger.info "#{title} uploaded successfully!"

    screenshot_path(title)
  end

  defp file_data(title) do
    screenshot_path(title)
    |> File.read!
  end

  defp upload(title, bucket, bucket_dir) do
    @ex_aws_client.put_s3_object(
      bucket,
      "/#{bucket_dir}/#{title}",
      file_data(title)
    )
    |> @ex_aws_client.make_request!
  end

  defp screenshot_path(title), do: "#{@screenshot_dir}/#{title}"
end
