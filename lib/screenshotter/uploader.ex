defmodule Screenshotter.Uploader do
  import ExAws, only: [request!: 1]
  import ExAws.S3, only: [put_object: 3]

  def run(title, bucket, bucket_dir, screenshot_dir \\ "./screenshots") do
    put_object(
      bucket,
      "/#{bucket_dir}/#{title}",
      file_data(screenshot_dir, title)
    )
    |> request!

    {:ok, "Uploaded #{title}"}
  catch
     :error, error -> {:error, error}
  end

  defp file_data(dir, title), do: File.read!("#{dir}/#{title}")
end
