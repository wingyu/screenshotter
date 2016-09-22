defmodule Screenshotter.Uploader do
  @ex_aws_client Application.get_env(:screenshotter, :ex_aws_client)

  def run(title, bucket, bucket_dir, screenshot_dir \\ "./screenshots") do
    @ex_aws_client.put_s3_object(
      bucket,
      "/#{bucket_dir}/#{title}",
      file_data(screenshot_dir, title)
    )
    |> @ex_aws_client.make_request!

    {:ok, "Uploaded #{title}"}
  rescue
     e -> {:error, e}
  end

  defp file_data(dir, title), do: File.read!("#{dir}/#{title}")
end
