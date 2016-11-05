defmodule Screenshotter.Uploader do
  require Logger

  @moduledoc "Implements the function to upload files"

  @ex_aws_client Application.get_env(:screenshotter, :ex_aws_client)
  @screenshot_dir Application.get_env(:screenshotter, :screenshot_dir)

  @doc "Uploads a file to a specified S3 bucket"
  @spec run(String.t, String.t, String.t) :: {atom, String.t}
  def run(title, bucket, bucket_dir) do
    Logger.info "Uploading #{title} to S3"

    upload(title, bucket, bucket_dir)

    {:ok, screenshot_path(title)}
  rescue
    e -> {:error, "Error uploading to AWS S3: #{e.message}"}
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
