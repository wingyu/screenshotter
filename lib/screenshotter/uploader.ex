defmodule Screenshotter.Uploader do
  @ex_aws_client Application.get_env(:screenshotter, :ex_aws_client)
  @screenshot_dir Application.get_env(:screenshotter, :screenshot_dir)

  def run(title, bucket, bucket_dir) do
    @ex_aws_client.put_s3_object(
      bucket,
      "/#{bucket_dir}/#{title}",
      file_data(title)
    )
    |> @ex_aws_client.make_request!

    {:ok, "Uploaded #{title}"}
  rescue
     e -> {:error, e}
  end

  defp file_data(title), do: File.read!("#{@screenshot_dir}/#{title}")
end
