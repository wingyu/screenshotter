defmodule Screenshotter.Uploader do
  @ex_aws_client Application.get_env(:screenshotter, :ex_aws_client)
  @screenshot_dir Application.get_env(:screenshotter, :screenshot_dir)

  def run(title, bucket, bucket_dir) do
    IO.puts "Uploading #{title} to S3"

    @ex_aws_client.put_s3_object(
      bucket,
      "/#{bucket_dir}/#{title}",
      file_data(title)
    )
    |> @ex_aws_client.make_request!

    {:ok, screenshot_path(title)}
  rescue
     e -> {:error, e}
  end

  defp file_data(title) do
    screenshot_path(title)
    |> File.read!
  end

  defp screenshot_path(title), do: "#{@screenshot_dir}/#{title}"
end
