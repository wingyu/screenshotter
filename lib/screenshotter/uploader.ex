defmodule Screenshotter.Uploader do
  import ExAws, only: [request!: 1]
  import ExAws.S3, only: [put_object: 3]

  def run(title, bucket, dir) do
    put_object(
      bucket,
      "/#{dir}/#{title}",
      File.read!("./screenshots/#{title}")
    )
    |> request!

    {:ok, "Uploaded #{title}"}
  catch
     :error, error -> {:error, error}
  end
end
