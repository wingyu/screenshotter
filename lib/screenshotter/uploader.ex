defmodule Screenshotter.Uploader do
  import ExAws
  def run(title, bucket) do
    ExAws.S3.put_object(
      bucket,
      "/uploads/#{title}",
      File.read!("./screenshots/#{title}")
    )
    |> ExAws.request!

    {:ok, "Uploaded #{title}"}
  catch
     :error, error -> {:error, error}
  end
end
