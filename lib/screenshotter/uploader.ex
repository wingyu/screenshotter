defmodule Screenshotter.Uploader do
  import ExAws
  #TODO NEED BETTER ERROR HANDLING
  def run(title, bucket) do
    ExAws.S3.put_object(
      bucket,
      "/uploads/#{title}",
      File.read!("./screenshots/#{title}")
    ) |>
    ExAws.request!
  end
end
